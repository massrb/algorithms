=begin

example of a two-pointer search algorithm that
efficiently computes ranks for player scores against a static leaderboard.

An arcade game player wants to climb to the top of the 
leaderboard and track their ranking. The game uses Dense 
Ranking, so its leaderboard works like this:

The player with the highest score is ranked number 1 on
the leaderboard.
Players who have equal scores receive the same ranking number,
 and the next player(s) receive the immediately following ranking number.
Example

ranked = [100, 90, 90, 80]
player = [70, 80, 105]


The ranked players will have ranks 1, 2, 2, and 3 respectively.
If the player's scores are 70, 80  and 105, their rankings after 
each game are 4th, 3rd and 1st. Return [4,3,1]

Function Description

Complete the climbingLeaderboard function in the editor below.

climbingLeaderboard has the following parameter(s):

int ranked[n]: the leaderboard scores
int player[m]: the player's scores

Returns
int[m]: the player's rank after each new score

Input Format

The first line contains an integer n, 
the number of players on the leaderboard.

The next line contains n space-separated integers , 
the leaderboard scores in decreasing order.

The next line contains an integer, m, the number games the player plays.

The last line contains m space-separated integers player[j], the game scores.

--------------

The existing leaderboard, ranked , is in descending order.

The player's scores, player , are in ascending order.
=end

def climb_leader_board(ranked, player)
  unique_ranked = ranked.uniq

  result = []
  i = unique_ranked.length - 1

  # For each player score (ascending order)
  player.each do |score|
    # Move up the leaderboard while the player score is >= leaderboard score
    while i >= 0 && score >= unique_ranked[i]
      i -= 1
    end
    # Rank is index + 2 (because of 0-based index and moving up)
    result << (i + 2)
  end

  result
end