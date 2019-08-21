import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './clock';
import Tab from './tab';


const tabs = [
    { title: "one", content: "tab 1 content"},
    { title: "two", content: "tab 2 content" },
    { title: "three", content: "tab 3 content" },
];


class Root extends React.Component {
  render() {
    return(
        <div>
            <Clock />
            <Tab tabs={tabs}/>
        </div>
    );
}
}
document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Root/>, document.getElementById('main'));
});