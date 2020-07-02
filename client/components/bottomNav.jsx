import React from 'react';

export default class BottomNav extends React.Component {
  render() {
    return (
      <div className="bottom-nav">
        <i className="fas fa-home fa-2x" onClick={this.props.getAllRecommendations}></i>
        <i className="fas fa-search fa-2x" onClick={() => this.props.setView('search', {})}></i>
        <i className="fas fa-list-ul fa-2x" onClick={() => this.props.getAllCollections(true)}></i>
        <i className="fas fa-plus fa-2x" onClick={() => this.props.setView('suggestion', {})}></i>
      </div>
    );
  }
}
