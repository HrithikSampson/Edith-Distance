
fn main(x: str<15>, y: pub str<15>) -> pub u15 {
    let mut x_bytes = x.as_bytes();
    let mut y_bytes = y.as_bytes();
    let mut x_len = 0 as u8;
    let mut y_len = 0 as u8;
    for i in 0..15 {
        x_len = x_len + ((x_bytes[i]!=0) as u8);
    }
    for j in 0..15 {
        y_len = y_len + ((y_bytes[j]!=0) as u8);
    }
    let mut dp = [[0 as u15;16];16];
    for i in 1..16 {
        for j in 1..16 {
            if x_bytes[i-1]!= 0 {
                if y_bytes[j-1]!=0 {
                    
                    dp[i][j] = max(((x_bytes[i-1] == y_bytes[j-1]) as u15 + dp[i-1][j-1]), max(max(dp[i-1][j] , dp[i][j-1]), dp[i-1][j-1]));
                
                }
            }
        }
    }
    max(x_len as u15,y_len as u15) - dp[x_len][y_len]
    
    //(((max(x_len as u15,y_len as u15) - dp[x_len][y_len])*(100 as u15))/(max(x_len as u15,y_len as u15)))
}
fn max(a: u15,b: u15) -> u15 {
    let mut maxm = b;
    if(a>b) {
        maxm = a;
    }
    maxm
}
