String readCategoriesQuery = """
  query ReadCategories {
    categories {
      id
      name
      videos {
        id
      }
    }
  }
""";