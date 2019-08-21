import React from 'react';
import ReactDOM from 'react-dom';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date()};
    this.tick = this.tick.bind(this);
  }
  tick() {
    this.setState({ time: new Date()});
  }
  componentDidMount() {
    this.intervalID = setInterval(this.tick, 1000);
  }
  componentWillUnmount() {
    clearInterval(this.intervalID);
  }
    render() {
        let hours = this.state.time.getHours();
        let minutes = this.state.time.getMinutes();
        let seconds = this.state.time.getSeconds();

      return(
        <div>
            <h1>Clock</h1>
            <div className='clock'>
                <p> 
                    <span>Time:</span>
                    <span> {hours}:{minutes}:{seconds}</span>
                </p>
                <p>
                    <span>Date:</span>
                    <span>{this.state.time.toDateString()}</span>
                </p>
            </div>
        </div>
      )
    }
}
