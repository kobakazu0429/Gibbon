import React, { useState, useEffect } from "react";
import axios from "axios";

const App = () => {
  const [books, setBooks] = useState<any[]>([]);

  useEffect(() => {
    (async () => {
      const res = await axios.get("http://localhost:9090/api/v1/books/");

      setBooks(res.data);
    })();
  }, []);

  return (
    <div>
      {books.map(v => (
        <p key={v.id}>
          {v.author} - {v.title}
        </p>
      ))}
    </div>
  );
};

export default App;
