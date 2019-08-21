import React from 'react';
import ReactDOM from 'react-dom';

export default class Tab extends React.Component{
    constructor(props){
        super(props);
        this.state = {selected: 0};
        console.log(props.tabs);
        
    }
    render(){
        const selectedTab = this.props.tabs[this.state.selected];

        return(
            <div>
                <h1>Tab</h1>
                rendering tab <br></br>
                
                title: {this.state.title} <br></br>
                content: {this.state.content} <br></br>
            </div>
        );
    }
}

class Header extends React.Component{
    render(){
        
    }
}