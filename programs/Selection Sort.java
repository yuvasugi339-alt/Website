import java.util.*;
class SelectionSort
{
    public static void main(String args[])
    {
        Scanner sc = new Scanner(System.in);
        int i,j,min = 0, t=0;
        System.out.println("Enter the number of elements :");
        int n = sc.nextInt();
        int m[] = new int[n];
        System.out.println("Enter the elements :");
        for(i = 0; i < n; i++)
        {
            m[i] = sc.nextInt();
        }
        for(i = 0; i < n-1; i++)
        {
            min = i;
            for(j = i+1; j < n; j++)
            {
                if(m[j] < m[min])
                {
                    min = j;
                }
            }
            t = m[i];
            m[i] = m[min];
            m[min] = t;
        }
        System.out.println("Sorted elements are :");
        for(i = 0; i < n; i++)
        {
            System.out.print(m[i] + " ");
        }        
    }
}