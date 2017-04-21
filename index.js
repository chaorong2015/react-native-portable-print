'use strict';
const { NativeModules } = require('react-native');
const NTPortablePrint = NativeModules.NTPortablePrint;
module.exports.PortablePrint = {
  testPrint: () => {
    console.log('NativeModules=testPrint=', NativeModules);
  	console.log('NTPortablePrint=testPrint=', NTPortablePrint);
    return new Promise((resolve, reject) => {
	    NTPortablePrint.testPrint("test message",(error, data) => {
			  if (error) {
			    console.log(error);
			    return reject(error);
			  } else {
			    console.log(data);
			    resolve(data);
			  }
		});
    });
  }
};