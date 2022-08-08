I will store in files two different key pairs: "work" and "personal". The private keys will be encrypted using ansible vault.

Then there will be a variable that needs to be set to either "work" or "personal" (otherwise fail).

My own computers will naturally have the personal key, and if that gets breached then I won't lose facd with my employer. Likewise if there is some sort of leak at work it won't affect me personally.

This seems like a reasonable compromise. It's not a lot more work than keeping just one set of keys around.
