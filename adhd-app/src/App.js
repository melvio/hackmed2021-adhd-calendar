import './App.css';
import React, { useState } from 'react';
import Calendar from 'react-calendar';
import 'react-calendar/dist/Calendar.css';
import ReactDOM from 'react-dom';

function App() {
  const [value, onChange] = useState(new Date());

  return (
    <div>
      <h1>Calendar</h1>
      <Calendar
        onChange={onChange}
        value={value}
      />
      <button onClick={setEvent(value)}>Set an event</button>
    </div>
  );
}

function setEvent(value) {
  
}

export default App;
