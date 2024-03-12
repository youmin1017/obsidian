
#Typescript


> [!NOTE] INFO
> [Source](https://pjchender.dev/typescript/ts-narrowing/#array-filter-%E7%9A%84%E5%95%8F%E9%A1%8C)

* TypeScript filter out nulls from an array @ StackOverflow
* ts-is-present @ GitHub
在 TypeScript 中，一般的 filter 並沒有辦法在型別上把 undefined 或 null 給過濾掉，舉例來說：

```ts
const arr = [1, 2, 3, null, undefined];
const filteredArr = arr.filter((item) => !!item); // (number | null | undefined)[]
```

filteredArr 最終被推導出來的型別仍然是 (number | null | undefined)[]。

## 使用 Type Guard

雖然對於 primitive type 來說，可以很方便的使用 TypeGuard 來處理，例如：

```ts
const filteredArr = arr.filter((item): item is number => !!item); //  number[]
```

加上 item is number 的 Type Guard 後，就可以讓 TypeScript 縮限成對應的型別。

但如果是 array of object 的話，除非有另外定義出該 object 的型別，不然會變的比較複雜。例如：

```ts
const arr = [{ age: 10 }, { age: 20 }, { age: 30 }, null, undefined];

const filteredArr = arr.filter((item) => !!item); // ({ age: number } | null | undefined)[]
```


比較好的作法是可以定義 isDefined 或 isPresent 這類的 Type Guard：

* [實作 isDefined 的 user-defined type guard](#實作 isDefined 的 user-defined type guard)
* [實作 isPresent 的 user-defined type guard](#實作 isPresent 的 user-defined type guard)

## 使用 flatMap
這之後除非我們先另外定義出該文件的型別，否則是無法用 Type Guard 處理的。在 StackOverflow 上則有一個透過 flatMap 的處理方式，雖然有點像 workaround，但需要的時候不失為一個簡便的方法。

這種方式特別適合用在 map 後的 filter：

```ts
const filteredArr = arr.flatMap((item) => (!item ? [] : [item])); // { age: number }[]
```


> [!WARNING] 
> 如此，利用 flatMap 的特性，TypeScript 將能推導出想要的型別。但要留意的是 flatMap 屬於 ES2019 後才支援的語法，這點在使用上仍須留意。


