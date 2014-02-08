def rand_text(amount = 5)
  ([*('A'..'Z'), *('a'..'z')]).sample(amount).join
end
