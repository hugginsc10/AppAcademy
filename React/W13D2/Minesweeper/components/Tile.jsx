import React from 'react';

class Tile extends React.Component{
    constructor(props){
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e){
        let flagged = e.altKey ? true : false
        this.props.updateGame(this.props.tile, flagged)
    }

    render() {
        const tile = this.props.tile;
        let carlos, text, count;
        if (tile.explored) {
            if (tile.bombed) {
                carlos = 'bombed';
                text = '\u2622';
            } else {
                carlos = 'explored';
                count = tile.adjacentBombCount();
                text = (count > 0 ? `${count}` : "");
            } 
        } else if (tile.flagged) {
            carlos = 'flagged';
            text = '\u2691';
        } else {
            carlos = 'unexplored';
        }
        carlos = `tile ${carlos}`;
        return ( <div className={carlos} onClick={this.handleClick}>{text}</div>
        );
    }

}
export default Tile;