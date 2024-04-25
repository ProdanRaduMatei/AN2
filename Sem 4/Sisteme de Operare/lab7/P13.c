#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_line_without_words(char *line, int argc, char *argv[])
{
    int start = 0;
    int len = strlen(line);
    for (int i = 0; i <= len; i++)
    {
        if (line[i] == ' ' || line[i] == '\t' || line[i] == '\n' || line[i] == '\0')
        {
            line[i] = '\0';
            char *word = &line[start];
            int j;
            for (j = 2; j < argc; j++)
            {
                if (strcmp(word, argv[j]) == 0)
                {
                    break;
                }
            }
            if (j == argc)
            {
                printf("%s", word);
                printf("%s", " ");
                if (line[i] != '\0')
                {
                    printf("%c", line[i]);
                }
            }
            else if (line[i] != '\0')
            {
                printf("%c", line[i]);
            }
            start = i + 1;
        }
    }
    printf("\n");
}

int main(int argc, char *argv[])
{
    if (argc < 2)
    {
        printf("Usage: %s <filename> <word1> <word2> ...\n", argv[0]);
        return 1;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL)
    {
        printf("Failed to open file\n");
        return 1;
    }

    char *line = NULL;
    size_t len = 0;
    int read;

    while ((read = (int)getline(&line, &len, file)) != -1)
    {
        print_line_without_words(line, argc, argv);
    }

    fclose(file);
    if (line)
    {
        free(line);
    }

    return 0;
}