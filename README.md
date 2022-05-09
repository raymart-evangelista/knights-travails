# knights-travails

Knights Travails is a program that takes a knight, its starting position, and its destination position on a chess board, and returns the shortest path taken to get from the starting position to the destiation position.

Creating the gameboard and a knight seemed fairly easy to implement. I decided to create an object for a gameboard which then initialized a knight object with a given starting position. However, creating the bulk of the program (the tree for the position moves the knight can make, and the method that returns the shortest path the knight can take) were the most challenging parts to completing the project. I had a difficult time understanding how to implement Knight#knight_moves. I spent a lot of time trying to grasp how to get the next set of moves a knight can traverse to from its current position, and I also spent a lot of time drawing out how the tree of moves looked like. Once I thought I got a better understanding of how the program should function, I would then try to implement something the program should do correctly.

Drawing out how the program function looked like helped me understand the task at hand a lot better. I would draw out a chessboard and imagine how a knight would move around on that board. Drawing out the tree of moves a knight can make from a given position also helped me progress further. Another key component that I believe helped with my success was learning how to implement linked lists and binary search trees in ruby from the previous lessons. Learning about Nodes, Breath First Search, and Depth First Search was foundational for me to complete this project.

By completing this prject, I feel a lot more confident working with search algorithms, trees, and objects.
