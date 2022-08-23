const aspects = ["misc"] as const;

for (const aspect of aspects) {
  import(`./aspects/${aspect}`);
}
