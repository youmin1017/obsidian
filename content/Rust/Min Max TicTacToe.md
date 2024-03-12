---
tags:
  - rust
---


> [!NOTE] Source Code
> https://github.com/youmin1017/minmax-tictactoe-rs.git


## Screenshot

![](https://github.com/youmin1017/minmax-tictactoe-rs/blob/main/images/result.png?raw=true)

## Main

```rust
fn main() {
    // create game instance
    let mut game = TicTacToe::new();

    loop {
        // ai turn
        // find best move index from (0..9)
        let ai_idx = TicTacToe::min_max(game, Player::Ai);
        game.board[ai_idx.index] = Some(Player::Ai);
        game.show();
        // if ai win, breaking the loop
        if game.winning(Player::Ai) {
            println!("AI winnning");
            break;
        }
        // human turn
        print!("Input index: ");
        let x: usize = text_io::read!();
        let y: usize = text_io::read!();
        game.board[x * 3 + y] = Some(Player::Human);
        game.show();
        // if human win, breaking the loop
        if game.winning(Player::Human) {
            println!("Human winnning");
            break;
        }
    }
}
```

## Structs

```rust
#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum Player {
    Ai,
    Human,
}

#[derive(Clone, Copy)]
struct TicTacToe {
    /// Human player   -- O
    /// AI    player   -- X
    /// None
    board: [Option<Player>; 9],
}

// min_max result
struct Move {
    index: usize,
    score: i32,
}
```

## Game and MinMax Algorithm methods

```rust
impl TicTacToe {
    fn new() -> Self {
        Self { board: [None; 9] }
    }

	/// MinMax Algorithm
    fn min_max(mut game: TicTacToe, player: Player) -> Move {
        let placable = game.placable();
        // if ai win, get 10 point
        if game.winning(Player::Ai) {
            return Move::from_score(10);
        // if human win, get -10 point
        } else if game.winning(Player::Human) {
            return Move::from_score(-10);
        // if tie, 0 point returned
        } else if placable.is_empty() {
            return Move::from_score(0);
        }

        // moves is used to record all possiable move and its points
        let mut moves: Vec<Move> = vec![];
        for idx in placable.into_iter() {
            game.board[idx] = Some(player);
            // human -> ai
            // ai    -> human
            let mut m = Self::min_max(
                game,
                match player {
                    Player::Human => Player::Ai,
                    Player::Ai => Player::Human,
                },
            );
            m.index = idx;
            game.board[idx] = None;
            moves.push(m);
        }
        // ai   : find maxmize point gotten
        // human: find minimize alternatively
        let best_move = match player {
            Player::Ai => moves.into_iter().max_by_key(|x| x.score),
            Player::Human => moves.into_iter().min_by_key(|x| x.score),
        };
        // return best move
        best_move.unwrap_or(Move::from_score(0))
    }

    /// Find all placable index
    fn placable(&self) -> Vec<usize> {
        self.board
            .iter()
            .enumerate()
            .filter(|(_, x)| **x == None)
            .map(|(i, _)| i)
            .collect()
    }

    /// Check if player is winning
    pub fn winning(&self, player: Player) -> bool {
        let p = Some(player);
        // let x = b[..3];
        self.board[..3] == [p; 3]
            || self.board[3..6] == [p; 3]
            || self.board[6..9] == [p; 3]
            || self.board[0] == p && self.board[3] == p && self.board[6] == p
            || self.board[1] == p && self.board[4] == p && self.board[7] == p
            || self.board[2] == p && self.board[5] == p && self.board[8] == p
            || self.board[0] == p && self.board[4] == p && self.board[8] == p
            || self.board[2] == p && self.board[4] == p && self.board[6] == p
    }

    /// Shoe board in terminal
    pub fn show(&self) {
        let transformer = |x: Option<Player>| match x {
            Some(Player::Human) => 'O',
            Some(Player::Ai) => 'X',
            None => ' ',
        };
        self.board.chunks(3).for_each(|x| {
            println!(
                "{} {} {}",
                transformer(x[0]),
                transformer(x[1]),
                transformer(x[2])
            )
        });
        println!("------------------------");
    }
}
```