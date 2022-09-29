const axios = require('axios');
require('dotenv').config();

class Service {


    getXapiHeader() {
        return {
            headers: {
                "Authorization": "Basic NzFiODE2MDJhMzcwNThjZjhlMDZhYWE2ZDk3MDNlMTBjZmE2YmNjMTo1NTI2NzBmOTc4NGFlZGVmZDM3YWUwNjI0ZGE2ZWM5Njk0MDM3YmYx",
                "X-Experience-API-Version": "1.0.1"
            }
        }
    }

    getXapiAuth() {
        return {
            auth: {
                username: "71b81602a37058cf8e06aaa6d9703e10cfa6bcc1",
                password: "552670f9784aedefd37ae0624da6ec9694037bf1"
            }
        }
    }

    getXapiStatements(payload) {


        if (payload.activity) {

            if (payload.verb) {
                return axios.get(process.env.XAPI_URL + `/statements?agent=${payload.agent}&verb=${payload.verb}&activity=${payload.activity}`, this.getXapiHeader(), this.getXapiAuth());
            } else {
                return axios.get(process.env.XAPI_URL + `/statements?agent=${payload.agent}&activity=${payload.activity}`, this.getXapiHeader(), this.getXapiAuth());
            }


        } else {

            if (payload.verb) {
                return axios.get(process.env.XAPI_URL + `/statements?agent=${payload.agent}&verb=${payload.verb}`, this.getXapiHeader(), this.getXapiAuth());
            } else {
                return axios.get(process.env.XAPI_URL + `/statements?agent=${payload.agent}`, this.getXapiHeader(), this.getXapiAuth());
            }
        }
    }

}

module.exports = new Service();