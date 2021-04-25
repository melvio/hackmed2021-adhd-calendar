import React, {useState} from "react";
import {render} from "react-dom";
import Calendar from "react-calendar";
import reportWebVitals from "./reportWebVitals";
import 'react-calendar/dist/Calendar.css';


const ADHDCalendar = () => {
    const [date, setDate] = useState(new Date());

    const onChange = date => {
        setDate(date);
    };

    return (
        <div>
            <Calendar showWeekNumbers onChange={onChange} value={date}/>
            {console.log(date.toString())}
            {date.toString()}
        </div>
    );
};

render(<ADHDCalendar/>, document.querySelector("#root"));

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals(console.log);
