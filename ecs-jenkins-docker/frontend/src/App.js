import React, { useEffect, useState } from 'react';
import './App.css';
import API_URL from './config';

function App() {
  const [successMessage, setSuccessMessage] = useState(); 
  const [failureMessage, setFailureMessage] = useState(); 

  useEffect(() => {
    const getId = async () => {
      try {
        const resp = await fetch(API_URL);
        const data = await resp.json();
        setSuccessMessage(data.id);
      } catch (e) {
        setFailureMessage(e.message);
      }
    };
    getId();
  }, []); // ✅ Added dependency array to prevent repeated calls

  return (
    <div className="App">
      {!failureMessage && !successMessage ? 'Fetching...' : null}
      {failureMessage ? failureMessage : null}
      {successMessage ? successMessage : null}
    </div>
  );
}

export default App;
