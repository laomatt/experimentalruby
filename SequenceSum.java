public class SequenceSum {
  public static void main (String args[]){

    System.out.println();


  }

  public static int[] sumOfN(int n) {
    int[] out=new int[n+1];

    for(int i=0; i<=n; i++)
    {
      int sum=0;
       for(int k=0; k<=i; k++)
       {
         sum+=k;
       }
       out[i]=sum;

    }
    return out;
  }
}