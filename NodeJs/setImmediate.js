const fs = require('fs');

fs.readFile(__filename,()=>{
    console.log("... Inside readFile");
    setTimeout(()=>{
        sleep(10);
        console.log("... setTimeout in 5 seconds");
    },5);
    setImmediate(()=> {
        console.log("... SetImmediate");
    })
})

