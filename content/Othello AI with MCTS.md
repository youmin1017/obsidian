## 前言

期中黑白棋比賽主要利用 MCTS 演算法決策要下的步

## 程式說明

程式主要包含了以下五個 Class

* Bot：主要提供 getAction method 給 competition callback 互叫
* State：MCTS 狀態的 Interface
* OthelloState：黑白棋的 MCTS State，繼承自 State 
* Node：MCTS Node
* MonteCarloTreeSearch：MCTS 演算法 Class

### 各 Class 詳細說明

> [!warning]  程式大多使用註解說明

#### Bot

```python
class BOT:
    def __init__(self, *args, **kargs):
        # Create MCTS Object for the purpost of search next action
        self.mcts = MonteCarloTreeSearch(timeLimit=2000)
        pass

    # a method called by competition callback
    def getAction(self, board, color):
        # search next action
        action = self.mcts.search(OthelloState(board, color))
        print('action = ', action)
        return action
```

#### State

> [!NOTE] State is interface class used by MCTS class

```python
class State:
    def getValidActions() -> np.ndarray:
        """Returns an iterable of all actions which can be taken from this state"""
        return np.array([])

    def takeAction(action) -> Self:
        """Returns the state which results from taking action action"""
        pass

    def isTerminal():
        """Returns whether this state is a terminal state"""
        pass

    def getReward() -> int:
        """Returns the reward for this state"""
        return 0

    def getWeight(self, action: tuple[int, int]) -> int:
        """用來計算 action 的加權"""
        return 1
```


#### OthelloState

```python
# inheriate from state 
class OthelloState(State):
    def __init__(self, board, color):
        self.board = board
        self.color = color
        self.size = len(board)

    # 取得合法步
    def getValidActions(self):
        return getValidMoves(self.board, self.color)

    # 執行 Action 回傳新的 Action
    def takeAction(self, action):
        board = self.board.copy()
        executeMove(board, self.color, action)
        return OthelloState(board, -self.color)

    # 如果無合法步或已分出勝負則視為終止
    def isTerminal(self):
        if len(self.getValidActions()) == 0:
            return True
        match isEndGame(self.board):
            case None: return False
            case _: return True

    # Reward 值被用於計算 UCT 
    def getReward(self):
        # 我方的合法部與對手合法部的差 ＋ 與對方的棋子數差異 ＝ Reward
        diff = len(getValidMoves(self.board, self.color)) - len(getValidMoves(self.board, -self.color))

        return np.sum(self.board == self.color) - np.sum(self.board == -self.color) + diff

    # Reward 的加權值，用於選擇或避開特定位置
    def getWeight(self, action: Optional[tuple[int, int]]) -> int:
        if action is None:
            return 1
            
        # 有角就下
        if action in [
            (0, 0),
            (0, self.size - 1),
            (self.size - 1, 0),
            (self.size - 1, self.size - 1),
        ]:
            return 100
        # 角周圍不下
        elif action in [
            (0, 1),
            (1, 0),
            (1, 1),
            (0, self.size - 2),
            (1, self.size - 1),
            (1, self.size - 2),
            (self.size - 2, 0),
            (self.size - 1, 1),
            (self.size - 2, 1),
            (self.size - 1, self.size - 2),
            (self.size - 2, self.size - 1),
            (self.size - 2, self.size - 2),
        ]:
            return -100
        # 角周圍的周圍會偏好下
        elif action in [
            (0, 2),
            (1, 2),
            (2, 2),
            (2, 1),
            (2, 0),
            (0, self.size - 3),
            (1, self.size - 3),
            (2, self.size - 3),
            (2, self.size - 2),
            (2, self.size - 1),
            (self.size - 3, 0),
            (self.size - 3, 1),
            (self.size - 3, 2),
            (self.size - 2, 2),
            (self.size - 1, 2),
            (self.size - 3, self.size - 1),
            (self.size - 3, self.size - 2),
            (self.size - 3, self.size - 3),
            (self.size - 2, self.size - 3),
            (self.size - 1, self.size - 3),
        ]:
            return 50
        else:
            return 1
```

#### Node

> [!NOTE] MCTS 節點

```python
class Node:
    def __init__(self, state: State, action: Optional[tuple[int, int]] = None, parent: Optional[Self] = None):
        self.state = state
        self.isTerminal = state.isTerminal()
        self.isFullyExpanded = self.isTerminal
        self.parent = parent
        self.numVisits = 0
        self.totalReward = 0
        self.children = {}
        self.weight = state.getWeight(action)
```

#### MCTS

```python
class MonteCarloTreeSearch:
    def __init__(
        self,
        timeLimit=None,  # format in milliseconds
        iterationLimit=None,
        explorationConstant=2,
        rolloutPolicy=randomPolicy,
    ):
        if timeLimit != None and iterationLimit != None:
            raise ValueError("Cannot have both a time limit and an iteration limit")
        if timeLimit != None:
            if timeLimit <= 0:
                raise ValueError("The time limit should be positive")
            self.timeLimit = timeLimit
            self.limitType = "time"
        elif iterationLimit != None:
            if iterationLimit <= 0:
                raise ValueError("The iteration limit should be positive")
            self.iterationLimit = iterationLimit
            self.limitType = "iterations"
        self.exploreConstant = explorationConstant
        self.rollout = rolloutPolicy

    # MCTS Search
    def search(self, initialState: State):
    # Create Root from initial state
        self.root = Node(initialState)

        # 在限制內不斷執行 MCTS 的四步驟
        # - Selection：選擇要進行展開下一層的葉節點。
        # - Expansion：展開下一層。
        # - Rollout (playout, simulation)：估這個節點的 value。
        # - Backpropagation：向上更新
        # Ref: https://liaowc.github.io/blog/mcts-monte-carlo-tree-search/
        match self.limitType:
            # 限制時間
            case "time":
                timeLimit = time.time() + self.timeLimit / 1000
                while time.time() < timeLimit:
                    self.execute()
            # 限制迭代次數
            case "iterations":
                for _ in range(self.iterationLimit):
                    self.execute()

        # find action from children (dict[action, node]) of root with best score
        bestNode = self.getBestChild(self.root)
        return next(
            action for action, node in self.root.children.items() if node is bestNode
        )

    def execute(self):
        newNode = self.select(self.root)
        reward = self.rollout(newNode.state)
        self.backpropagate(newNode, reward)

    # Generated by copilot
    def select(self, node: Node) -> Node:
        while not node.isTerminal:
            # - if node is fully expanded, select best child and continue
            # - fully expanded represents the parent have no valid action
            # - terminal represents gameover 
            if node.isFullyExpanded:
                node = self.getBestChild(node)
            # 如果不是 FullExpanded 則展開與回傳新節點
            else:
                return self.expand(node)
        # if node.isTerminal (GameOver) return current node
        return node

    def expand(self, node: Node):
        # 取得所有 Valid Actions
        actions = node.state.getValidActions()
        for action in actions:
            # since ndarray is not hashable, convert it to tuple[int, int]
            __action = tuple(action)
            if __action not in node.children:
                # 展展開新的結點到 Children
                # Children is hashmap action to node
                newNode = Node(node.state.takeAction(action), __action, node)
        
                node.children[__action] = newNode
                if len(actions) == len(node.children):
                    node.isFullyExpanded = True
                return newNode
        raise Exception("Should never reach here")

    def backpropagate(self, node: Node, reward: int):
        while node is not None:
            node.numVisits += 1
            node.totalReward += reward
            node = node.parent

    def getBestChild(self, node: Node) -> Node:
        def UCT(node: Node, child: Node) -> float:
            return (
                child.totalReward / child.numVisits
                + self.exploreConstant
                * math.sqrt(math.log(node.numVisits) / child.numVisits)
                * child.weight # 乘上加權
            )

        # 計算 Node UCT 值與選擇最佳 Node
        return max(node.children.values(), key=lambda child: UCT(node, child))
```