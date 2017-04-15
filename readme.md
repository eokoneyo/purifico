## purifico

Docker Toolbox for Nodejs Post-mortem debugging, comes with `lldb`, `perf` and `llnode`

This project is heavily inspired by the works of [Howard Hellyer](https://github.com/hhellyer) and [Brendan Gregg](https://github.com/brendangregg)

### Setup

- Build docker image

    ```bash
    ./start_disposable.sh
    ```
- Copy the core dump and the node binary executable specific to the process that generated the core dump see llnode issue [#74](https://github.com/nodejs/llnode/issues/74)
- To use `findjsobjects` and other similar commands, a memory ranges file must be generated. Simply run `./set_memoryranges.sh` and follow the prompt.


### Reading Material

Cant seem to figure out what to do with the image start here

- [Exploring Node.js core dumps using the llnode plugin for lldb.](https://developer.ibm.com/node/2016/08/15/exploring-node-js-core-dumps-using-the-llnode-plugin-for-lldb/)

- [llnode for Node.js Memory Leak Analysis](http://www.brendangregg.com/blog/2016-07-13/llnode-nodejs-memory-leak-analysis.html)