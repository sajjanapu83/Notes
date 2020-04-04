```ruby

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef void (*Funstr)(char *);

void strLength(char *s) { 
  int i;
  for (i = 0; s[i] != '\0'; i++);
  printf ("strLength = %d", i);
}

void strUpper(char *s) {
  for (int i = 0; s[i] != '\0'; i++) {
    if (s[i] >= 97 && s[i] <= 122) {
       s[i] = s[i] - 32;
    }
  }
  printf ("\nUpper = %s", s);
}

void strLower(char *s) { 
  for (int i = 0; s[i] != '\0'; i++) {
    if (s[i] >= 65 && s[i] <= 90) {
	   s[i] = s[i] + 32;
	}
  }
  printf ("\nLower = %s ", s);
}

void swap(char *a, char *b) {
    *a = *a ^ *b;
    *b = *a ^ *b;
    *a = *a ^ *b;
}

void strReverse(char *s) {
    
    for(int i=0,j=strlen(s)-1;i<j;i++,j--)
       swap(&s[i], &s[j]);
    printf ("\nReverse = %s ", s);
}

void IsPalindrome(char *s) {
    for(int i=0,j=strlen(s)-1;i<j;i++,j--) {
        if (s[i] != s[j]) {
            printf("%s is not a palindrome");
            return;
        }
    }
    printf("\n%s is a palindrome", s);
    
}

int main()
{
    char str1[] = "WeLcome" , str2[] = "madam";
    
    Funstr strOperations[] = { strLength, strUpper, strLower, strReverse, IsPalindrome };
    strOperations[0](str1);
    strOperations[1](str1);
    strOperations[2](str1);
    strOperations[3](str1);
    strOperations[4](str1); strOperations[4](str2);
    

    return 0;
}


```
