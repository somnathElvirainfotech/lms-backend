class Header {
    
    constructor() {
        this._accessToken = "oko";
    }

     getHeader() {
        return {
            headers: {
                "Content-Type": "application/json",
                "Authorization":this._accessToken
            }
        }
    }

     setHeader(accessToken) {
        this._accessToken = accessToken;
    }
}

module.exports = Header;