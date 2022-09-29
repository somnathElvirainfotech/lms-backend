class Common {
    
    static Capitalize(str) {
        var firstLetter = str.slice(0, 1);
        return firstLetter.toUpperCase() + str.substring(1);
    }

    static chkUserType(data) {
        if (data === 1) {
            return 'Admin';
        }
        else if (data === 2) {
            return 'Supervisor';
        }
        else if (data === 3) {
            return 'Manager';
        }
        else if (data === 4) {
            return 'Creator';
        }
        else if (data === 5) {
            return 'User';
        }
        else if (data == 5) {
            return 'Public';
        }
    }


    static formatDate(date) {
        var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

        if (month.length < 2)
            month = '0' + month;
        if (day.length < 2)
            day = '0' + day;

        return [year, month, day].join('-');
    }


    
}

module.exports = Common;

