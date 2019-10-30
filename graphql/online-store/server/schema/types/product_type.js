// Write the product type schema on your own. Recall that
// products have an _id, name, category, description,
// and weight.Again, don't worry about the cost field
// for now - we will add that later.

const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLID } = graphql;

const Product = mongoose.model("product")

const ProductType = new GraphQLObjectType({
  name: "ProductType",
  // remember we wrap the fields in a thunk to avoid circular dependency issues
  fields: () => ({
    _id: { type: GraphQLID },
    name: { type: GraphQLString },
    category: { 
      type: require('./category_type'),
      resolve(parentValue) {
        return Product.findById(parentValue._id)
          .populate("category")
          .then(product => {
            return product.category
          });
      }
     },
    description: { type: GraphQLString},
    weight: { type: GraphQLInt }
  })
});

module.exports = ProductType;