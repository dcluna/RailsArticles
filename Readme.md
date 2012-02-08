# Começando com Rails #
Um pequeno exercício em Rails: implementar uma interface web para cadastramento/gerenciamento de artigos. Ou seja, uma interface para operações CRUD em um modelo Post. Cada artigo pode ter várias tags, que são consideradas um modelo à parte.  
Alguns requerimentos de UI:
* Data de publicação (formato DD/MM/AAAA), utilizar um Date Picker para facilitar o preenchimento. Ver [RailsCasts 213 - Calendars](http://railscasts.com/episodes/213-calendars)
* Tags - Utilizar um elemento visual com autocompleter (ver: [RailsCasts 258 - Token Fields](http://railscasts.com/episodes/258-token-fields)). Somente poderão ser selecionadas tags pré-existentes.