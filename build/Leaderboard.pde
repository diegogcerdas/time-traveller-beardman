import java.util.Scanner;
import java.util.ArrayList;

class Leaderboard{
  
  public Leaderboard(){
    scoreStrings = new String[5];
    updateLeaders();
  }
  
  Score[] currentScores;
  String[] scoreStrings;
  
  void logNew(int distance, String username, int place){
    ArrayList<Score> newScores = new ArrayList();
    for (int i = 0; i < place; i++){
      newScores.add(currentScores[i]);
    }
    newScores.add(new Score(distance, username));
    for (int i = place; i < currentScores.length - 1; i++){
      newScores.add(currentScores[i]);
    }
    PrintWriter output = createWriter("textFiles/leaderboard.txt"); 
    for (Score score: newScores){
      output.println(score.toString());
    }
    output.flush();
    output.close(); 
    updateStrings();
  }
  
  int checkPlace(int distance){
    currentScores = getScores();
    for (int i = 0; i < currentScores.length; i++){
      if (currentScores[i] != null && distance > currentScores[i].score)
        return i;
    }
    return 5;
  }
  
  void updateLeaders(){
    currentScores = getScores();
    updateStrings();
  }
  
  void updateStrings(){
    for (int i = 0; i < 5; i++){
    Score current = currentScores[i];
    StringBuilder sb = new StringBuilder();
    if (i==0) sb.append(" ");
    sb.append((i+1) + ". ");
    sb.append(current.username);
    for(int k = 0; k < 35-(current.username.length()*2.7) - (current.score + "").length(); k++)
      sb.append(".");
    sb.append(current.score);
    scoreStrings[i] = sb.toString();
  }
  }
  
  private Score[] getScores(){
    Score[] scores = new Score[5];
    try {
    BufferedReader reader = createReader("textFiles/leaderboard.txt");
    String line;
    Scanner entryScanner;
    int counter = 0;
    while((line = reader.readLine()) != null){
      entryScanner = new Scanner(line);
      int score = entryScanner.nextInt();
      String username = entryScanner.next();
      scores[counter] = new Score(score, username);
      counter++;
    }
    reader.close();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return scores;
  }
    
}

class Score{
  int score;
  String username;
  public Score(int score_, String username_){
    score = score_;
    username = username_;
  }
  
  String toString(){
    return score + " " + username;
  }
}
