import React from "react";
// import React, { Component } from "react";
// import gql from "graphql-tag";
// import { Query } from "react-apollo";
import { HashRouter, Switch, Route } from 'react-router-dom';
import ProductIndex from "./products/ProductIndex";
import Login from "./Login";
import Register from "./Register";
import AuthRoute from '../util/route_util'
import Nav from "./Nav";
import ProductDetail from './products/ProductDetail';
import CreateProduct from './products/CreateProduct';

const App = () => {
  return (
    <HashRouter>
      <div>
        <Nav />
        <h1>Online Store</h1>
        <Switch>
          <Route exact path="/products/new" component={CreateProduct} />
          <Route exact path="/products/:id" component={ProductDetail} />
          <AuthRoute exact path="/register" component={Register} routeType="auth" />
          <AuthRoute exact path="/login" component={Login} routeType="auth" />
          <Route path="/" component={ProductIndex} />
        </Switch>
      </div>
    </HashRouter>
  );
};

export default App;