const graphql = require("graphql");
const {
  GraphQLSchema
} = graphql;
// Remember we create a GraphQL schema instance by handing `GraphQLSchema` a root query
// like the one we just wrote!
const Mutations = require('./mutations');
const RootQueryType = require("./root_query_type");

// create and export our schema
module.exports = new GraphQLSchema({
  query: RootQueryType,
  mutation: Mutations
});