'use strict';
const { NativeModules } = require('react-native');
const RNPrintPDF = NativeModules.RNPrintPDF;
module.exports.PortablePrint = {
  testPrint: (msg) => {
   //  console.log('NativeModules=testPrint=', NativeModules);
  	// console.log('RNPrintPDF=testPrint=', RNPrintPDF);
    return new Promise((resolve, reject) => {
    	if(!msg){
    		msg ='test message'
    	};
	    RNPrintPDF.testPrint(msg,(error, data) => {
	    	console.log('进入testPrint');
			  if (error) {
			    console.log(error);
			    return reject(error);
			  } else {
			    console.log(data);
			    resolve(data);
			  }
		});
    });
  },
  printPDF: (portName,portSettings) => {
    return new Promise((resolve, reject) => {
	    RNPrintPDF.printPDF(portName, portSettings,(error, data) => {
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