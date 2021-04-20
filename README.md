# Hackathon---Home-Field-Advantage

<img src="http://www.travelandsports.com.au/wp-content/uploads/2017/02/07_lsu0446-tiger-stadium-at-sundown-min.jpg" align="right"
     alt="Sold out Stadium" width="150" height="20">
     
UC Davis has partnered with Google for AggieHacks 2021, a competition focused around the analyzing the impacts of COVID-19. 
We have focused on trying to discern the impact COVID has had on sports because of fans being limited at games and also when it is safe to go back to sporting events.

## What is in the Repo

* Data Collection Tools
* Programs Focused on Statistical Analysis
* Visualizations



## Data Collection Tools

This Repo is split into to main parts - sports attendance and COVID vaccination predictions. 

### Sports Attendance, 
Data was used from sports-reference.com. It was obtained in a several different ways. For hockey and soccer, data was taken directly from the website and cleaned in excel. For baseball and basketball, two different API's in python were used to gather the relevant data. Both of these API's leverage sports-reference.com, however note that the API for basketball only had average attendance for a given season, so generalizations were made to take the season averages to the individual game level (in our final dataset, for the 2020-2021 NBA season, we manually obtained each game's attendance, so the previous statement only applies to earlier seasons). The process for gathering data on American Football was a little more tedious. Another API was used in Python that pulled data fromanother Github repo. This rep
The file Hackathon.ipynb has the code for these API's and also is where the different sports datasets were combined. 

### COVID Vaccination Predictions
Data for COVID vaccinations was ......................................

## Programs Focused on Statistical Analysis

### Sports Attendance, 
The file Hackathon.ipynb (same one where ata was collected) has the code for these API's and also is where the different sports datasets were combined as well as where the statistical tests were done. These statistical tests checked whether teams were fairing worse at their home venues during COVID in part due to the lack of fans.

### COVID Vaccination Predictions

1. Size Limit contains a CLI tool, 3 plugins (`file`, `webpack`, `time`)
   and 3 plugin presets for popular use cases (`app`, `big-lib`, `small-lib`).
   A CLI tool finds plugins in `package.json` and loads the config.
2. If you use the `webpack` plugin, Size Limit will bundle your JS files into
   a single file. It is important to track dependencies and webpack polyfills.
   It is also useful for small libraries with many small files and without
   a bundler.
3. The `webpack` plugin creates an empty webpack project, adds your library
   and looks for the bundle size difference.
4. The `time` plugin compares the current machine performance with that of
   a low-priced Android devices to calculate the CPU throttling rate.
5. Then the `time` plugin runs headless Chrome (or desktop Chrome if it’s
   available) to track the time a browser takes to compile and execute your JS.
   Note that these measurements depend on available resources and might
   be unstable. [See here](https://github.com/mbalabash/estimo/issues/5)
   for more details.


## Usage

### JS Applications

Suitable for applications that have their own bundler and send the JS bundle
directly to a client (without publishing it to npm). Think of a user-facing app
or website, like an email client, a CRM, a landing page or a blog with
interactive elements, using React/Vue/Svelte lib or vanilla JS.

<details><summary><b>Show instructions</b></summary>

1. Install the preset:

    ```sh
    $ npm install --save-dev size-limit @size-limit/file
    ```

2. Add the `size-limit` section and the `size` script to your `package.json`:

    ```diff
    + "size-limit": [
    +   {
    +     "path": "dist/app-*.js"
    +   }
    + ],
      "scripts": {
        "build": "webpack ./webpack.config.js",
    +   "size": "npm run build && size-limit",
        "test": "jest && eslint ."
      }
    ```

3. Here’s how you can get the size for your current project:

    ```sh
    $ npm run size

      Package size: 30.08 kB with all dependencies, minified and gzipped
    ```

4. Now, let’s set the limit. Add 25% to the current total time and use that as
   the limit in your `package.json`:

    ```diff
      "size-limit": [
        {
    +     "limit": "35 kB",
          "path": "dist/app-*.js"
        }
      ],
    ```

5. Add the `size` script to your test suite:

    ```diff
      "scripts": {
        "build": "webpack ./webpack.config.js",
        "size": "npm run build && size-limit",
    -   "test": "jest && eslint ."
    +   "test": "jest && eslint . && npm run size"
      }
    ```

6. If you don’t have a continuous integration service running, don’t forget
   to add one — start with [Travis CI].

</details>


### JS Application and Time-based Limit

File size limit (in kB) is not the best way to describe your JS application
cost for developers. Developers will compare the size of the JS bundle
with the size of images. But browsers need much more time to parse 100 kB
of JS than 100 kB of an image since JS compilers are very complex.

This is why Size Limit support time-based limit. It runs headless Chrome
to track the time a browser takes to compile and execute your JS.

<details><summary><b>Show instructions</b></summary>

1. Install the preset:

    ```sh
    $ npm install --save-dev size-limit @size-limit/preset-app
    ```

2. Add the `size-limit` section and the `size` script to your `package.json`:

    ```diff
    + "size-limit": [
    +   {
    +     "path": "dist/app-*.js"
    +   }
    + ],
      "scripts": {
        "build": "webpack ./webpack.config.js",
    +   "size": "npm run build && size-limit",
        "test": "jest && eslint ."
      }
    ```

3. Here’s how you can get the size for your current project:

    ```sh
    $ npm run size

      Package size: 30.08 kB with all dependencies, minified and gzipped
      Loading time: 602 ms   on slow 3G
      Running time: 214 ms   on Snapdragon 410
      Total time:   815 ms
    ```

4. Now, let’s set the limit. Add 25% to the current total time and use that as
   the limit in your `package.json`:

    ```diff
      "size-limit": [
        {
    +     "limit": "1 s",
          "path": "dist/app-*.js"
        }
      ],
    ```

5. Add the `size` script to your test suite:

    ```diff
      "scripts": {
        "build": "webpack ./webpack.config.js",
        "size": "npm run build && size-limit",
    -   "test": "jest && eslint ."
    +   "test": "jest && eslint . && npm run size"
      }
    ```

6. If you don’t have a continuous integration service running, don’t forget
   to add one — start with [Travis CI].

</details>


### Big Libraries

JS libraries > 10 kB in size.

This preset includes headless Chrome, and will measure your lib’s execution
time. You likely don’t need this overhead for a small 2 kB lib, but for larger
ones the execution time is a more accurate and understandable metric that
the size in bytes. Library like [React] is a good example for this preset.

<details><summary><b>Show instructions</b></summary>

1. Install preset:

    ```sh
    $ npm install --save-dev size-limit @size-limit/preset-big-lib
    ```

2. Add the `size-limit` section and the `size` script to your `package.json`:

    ```diff
    + "size-limit": [
    +   {
    +     "path": "dist/react.production-*.js"
    +   }
    + ],
      "scripts": {
        "build": "webpack ./scripts/rollup/build.js",
    +   "size": "npm run build && size-limit",
        "test": "jest && eslint ."
      }
    ```

3. If you use ES modules you can test the size after tree-shaking with `import`
   option:

    ```diff
      "size-limit": [
        {
          "path": "dist/react.production-*.js",
    +     "import": "{ createComponent }"
        }
      ],
    ```

4. Here’s how you can get the size for your current project:

    ```sh
    $ npm run size

      Package size: 30.08 kB with all dependencies, minified and gzipped
      Loading time: 602 ms   on slow 3G
      Running time: 214 ms   on Snapdragon 410
      Total time:   815 ms
    ```

5. Now, let’s set the limit. Add 25% to the current total time and use that
   as the limit in your `package.json`:

    ```diff
      "size-limit": [
        {
    +     "limit": "1 s",
          "path": "dist/react.production-*.js"
        }
      ],
    ```

6. Add a `size` script to your test suite:

    ```diff
      "scripts": {
        "build": "rollup ./scripts/rollup/build.js",
        "size": "npm run build && size-limit",
    -   "test": "jest && eslint ."
    +   "test": "jest && eslint . && npm run size"
      }
    ```

7. If you don’t have a continuous integration service running, don’t forget
   to add one — start with [Travis CI].
8. Add the library size to docs, it will help users to choose your project:

    ```diff
      # Project Name

      Short project description

      * **Fast.** 10% faster than competitor.
    + * **Small.** 15 kB (minified and gzipped).
    +   [Size Limit](https://github.com/ai/size-limit) controls the size.
    ```

</details>


### Small Libraries

JS libraries < 10 kB in size.

This preset will only measure the size, without the execution time, so it’s
suitable for small libraries. If your library is larger, you likely want
the Big Libraries preset above. [Nano ID] or [Storeon] are good examples
for this preset.

<details><summary><b>Show instructions</b></summary>

1. First, install `size-limit`:

    ```sh
    $ npm install --save-dev size-limit @size-limit/preset-small-lib
    ```

2. Add the `size-limit` section and the `size` script to your `package.json`:

    ```diff
    + "size-limit": [
    +   {
    +     "path": "index.js"
    +   }
    + ],
      "scripts": {
    +   "size": "size-limit",
        "test": "jest && eslint ."
      }
    ```

3. Here’s how you can get the size for your current project:

    ```sh
    $ npm run size

      Package size: 177 B with all dependencies, minified and gzipped
    ```

4. If your project size starts to look bloated, run `--why` for analysis:

    ```sh
    $ npm run size -- --why
    ```

5. Now, let’s set the limit. Determine the current size of your library,
   add just a little bit (a kilobyte, maybe) and use that as the limit
   in your `package.json`:

    ```diff
     "size-limit": [
        {
    +     "limit": "9 kB",
          "path": "index.js"
        }
     ],
    ```

6. Add the `size` script to your test suite:

    ```diff
      "scripts": {
        "size": "size-limit",
    -   "test": "jest && eslint ."
    +   "test": "jest && eslint . && npm run size"
      }
    ```

7. If you don’t have a continuous integration service running, don’t forget
   to add one — start with [Travis CI].
8. Add the library size to docs, it will help users to choose your project:

    ```diff
      # Project Name

      Short project description

      * **Fast.** 10% faster than competitor.
    + * **Small.** 500 bytes (minified and gzipped). No dependencies.
    +   [Size Limit](https://github.com/ai/size-limit) controls the size.
    ```

</details>

[Travis CI]: https://github.com/dwyl/learn-travis
[Storeon]: https://github.com/ai/storeon/
[Nano ID]: https://github.com/ai/nanoid/
[React]: https://github.com/facebook/react/


## Reports

Size Limit has a [GitHub action] that comments and rejects pull requests based
on Size Limit output.

1. Install and configure Size Limit as shown above.
2. Add the following action inside `.github/workflows/size-limit.yml`

```yaml
name: "size"
on:
  pull_request:
    branches:
      - master
jobs:
  size:
    runs-on: ubuntu-latest
    env:
      CI_JOB_NUMBER: 1
    steps:
      - uses: actions/checkout@v1
      - uses: andresz1/size-limit-action@v1.0.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```


## Config

Size Limits supports three ways to define config.

1. `size-limit` section in `package.json`:

   ```json
     "size-limit": [
       {
         "path": "index.js",
         "import": "{ createStore }",
         "limit": "500 ms"
       }
     ]
   ```

2. or a separate `.size-limit.json` config file:

   ```js
   [
     {
       "path": "index.js",
       "import": "{ createStore }",
       "limit": "500 ms"
     }
   ]
   ```

3. or a more flexible `.size-limit.js` config file:

   ```js
   module.exports = [
     {
       path: "index.js",
       import: "{ createStore }",
       limit: "500 ms"
     }
   ]
   ```

Each section in the config can have these options:

* **path**: relative paths to files. The only mandatory option.
  It could be a path `"index.js"`, a [pattern] `"dist/app-*.js"`
  or an array `["index.js", "dist/app-*.js", "!dist/app-exclude.js"]`.
* **import**: partial import to test tree-shaking. It could be `"{ lib }"`
  to test `import { lib } from 'lib'` or `{ "a.js": "{ a }", "b.js": "{ b }" }`
  to test multiple files.
* **limit**: size or time limit for files from the `path` option. It should be
  a string with a number and unit, separated by a space.
  Format: `100 B`, `10 kB`, `500 ms`, `1 s`.
* **name**: the name of the current section. It will only be useful
  if you have multiple sections.
* **entry**: when using a custom webpack config, a webpack entry could be given.
  It could be a string or an array of strings.
  By default, the total size of all entry points will be checked.
* **webpack**: with `false` it will disable webpack.
* **running**: with `false` it will disable calculating running time.
* **gzip**: with `false` it will disable gzip compression.
* **brotli**: with `true` it will use brotli compression and disable gzip compression.
* **config**: a path to a custom webpack config.
* **ignore**: an array of files and dependencies to exclude from
  the project size calculation.

If you use Size Limit to track the size of CSS files, make sure to set
`webpack: false`. Otherwise, you will get wrong numbers, because webpack
inserts `style-loader` runtime (≈2 kB) into the bundle.

[pattern]: https://github.com/sindresorhus/globby#globbing-patterns


## Plugins and Presets

Plugins:

* `@size-limit/file` checks the size of files with Gzip, Brotli
  or without compression.
* `@size-limit/webpack` adds your library to empty webpack project
  and prepares bundle file for `file` plugin.
* `@size-limit/time` uses headless Chrome to track time to execute JS.
* `@size-limit/dual-publish` compiles files to ES modules with [`dual-publish`]
  to check size after tree-shaking.

Plugin presets:

* `@size-limit/preset-app` contains `file` and `time` plugins.
* `@size-limit/preset-big-lib` contains `webpack`, `file`, and `time` plugins.
* `@size-limit/preset-small-lib` contains `webpack` and `file` plugins.

[`dual-publish`]: https://github.com/ai/dual-publish


## JS API

```js
const sizeLimit = require('size-limit')
const filePlugin = require('@size-limit/file')
const webpackPlugin = require('@size-limit/webpack')

sizeLimit([filePlugin, webpackPlugin], [filePath]).then(result => {
  result //=> { size: 12480 }
})
```
