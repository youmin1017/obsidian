#NextJS #UnoCSS

## Create T3 App

>[!Warning]
>To use `UnoCSS`, do not selet install tailwindcss

```bash
pnpm create t3-app@lates
```

## Install UnoCSS

### Install followings packages

```bash
pnpm i -D "unocss" "@unocss/webpack"                      \
```

* unocss
* @unocss/webpack
* @unocss/preset-attributify: for enable attributify
* @unocss/transformer-attributify-jsx: for enable attributify in jsx/tsx

### Modify below files

[unocss/examples/next at main · unocss/unocss (github.com)](https://github.com/unocss/unocss/tree/main/examples/next)

```js
// uno.config.ts
import { defineConfig, presetAttributify, presetIcons, presetUno, presetWebFonts } from 'unocss'

export default defineConfig({
  presets: [
    presetUno(),
    // ...
  ],
})
```

```js
/* next.config.mjs */

// const UnoCSS = require('@unocss/webpack').default
const UnoCSS = (await import('@unocss/webpack')).default

/** @type {import("next").NextConfig} */
const config = {
  reactStrictMode: true,
  webpack: (config) => {
    config.cache = false // hot reload
    config.plugins.push(
      UnoCSS(),
    )
    return config
  },
```

Import `uno.css` in `_app.tsx`
```js
/* _app.tsx */

import '@unocss/reset/tailwind.css'
import 'uno.css'

import type { AppProps } from 'next/app'

function MyApp({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}

export default MyApp
```

### Attributify

https://unocss.dev/presets/attributify

```bash
pnpm i -D "@unocss/preset-attributify"           \
          "@unocss/transformer-attributify-jsx"
```

**Transformer**
[unocss/packages/transformer-attributify-jsx at main · unocss/unocss (github.com)](https://github.com/unocss/unocss/tree/main/packages/transformer-attributify-jsx)

