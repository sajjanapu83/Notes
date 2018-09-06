const EventEmitter = require('events');

class withlogs extends EventEmitter {

    mycall(myfunc){
        console.log('Before executing myfunc');
        this.emit('myprint');
        myfunc();
        console.log('After executing myfunc');
    }
}
const withlog = new withlogs();

withlog.on('myprint', ()=> { console.log('Custom myprint Listner')});
withlog.mycall(()=> { console.log('Executing myfunc logic.....')});
