<template>
  <v-app>
    <v-container fluid>
      <v-row>
        <v-col cols="12">
          <v-row
            align="start"
            justify="center"
            class="grey lighten-5"
          >
            <v-col cols="12" sm="9">
              <v-text-field
                label="Книги"
                placeholder="Поиск книги"
                solo
              ></v-text-field>
            </v-col>
            <v-col
              v-for="book in books"
              :key="book.id"
              cols="12"
            >
            <v-card
              class="mx-auto"
              max-width="900"
              outlined
              tile
            >
              <div class="d-flex flex-no-wrap justify-space-between">
                <v-avatar
                  class="ma-3"
                  size="300"
                  tile
                >
                  <v-img :src="book.cover_image"></v-img>
                </v-avatar>
                <div>
                  <v-card-title
                    size="300"
                    class="headline"
                    v-text="book.title"
                  ></v-card-title>
                  <v-card-title
                    size="200"
                    v-text="book.subtitle"
                  ></v-card-title>
                  <v-card-subtitle v-text="book.authors"></v-card-subtitle>
                </div>
              </div>
            </v-card>
          </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      books: [
        { id: 1,
          title: "The Book #1!",
          subtitle: "The Book Subtitle",
          authors: "author1",
          cover_image: "https://prmyazilim.com/images/PRM/knowledgebase.png",
          status: "На руках",
          description: "description",
          isbn_10: "isbn_10",
          isbn_13: "isbn_13",
          publisher: "publisher",
          page_count: "200",
        },
        { id: 2,
          title: "The Book #2!",
          subtitle: "The Book Subtitle",
          authors: "author2",
          cover_image: "https://prmyazilim.com/images/PRM/knowledgebase.png",
          status: "Свободна",
          description: "description",
          isbn_10: "isbn_10",
          isbn_13: "isbn_13",
          publisher: "publisher",
          page_count: "340"
         },
      ]
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
