package org.moeaframework.problem.AntennaArray;

import java.io.BufferedWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import org.apache.commons.math3.complex.Complex;

//import org.apache.commons.csv.CSVFormat;
//import org.apache.commons.csv.CSVPrinter;


public class ExhaustiveMultiObjective {
	public static int count;
	
  	// Restricciones en el número de elementos de antena por subarreglo kj //
  
	private static byte k1 = 3;
	private static byte k2 = 3;
	private static byte k3 = 3;
	private static byte k4 = 3;
	
	private static int PS = k1+k2+k3+k4;
	private static long SIZE = (long) ( fact(PS) / (fact(k1) * fact(k2) * fact(k3) * fact(k4)));
	
  
  	// Sin restricciones en el número de elementos de antena por subarreglo |N'|^n //
  
  	/*private static int PS = 12;
	private static long SIZE = (long) Math.pow(4, PS);*/
	
  	// Muestra de soluciones en espacios de búsqueda de gran tamaño //
  
 	//private static long SIZE = 5000;
	
	private static byte[][] sequences = new byte[(int)SIZE][PS];
	public static double[] p = new double[1801];
	public static byte[] seq = new byte[PS];
	public static double sll, beamwidth;
	public static int seqbound = seq.length-1, theta; 
	
	public static class Array {
		double s, w, time;
		byte[] sq;
		
		Array(byte[] sq, double sll, double bandwidth, double time) {
			this.sq  = sq;
			this.s = sll;
			this.w = bandwidth;
			this.time = time*0.000000001;
		}
		
		public byte[] get_seq() { return this.sq; }
		public double get_sll() { return this.s; }
		public double get_beamwidth() { return this.w; }
		public double get_time() { return this.time; }
	}
	
	public static Array[] arrays = new Array[(int) SIZE];
	public static ArrayList<Array> front = new ArrayList<Array>();
	
	/*@SuppressWarnings("static-access")
	public ExhaustiveMultiObjective(byte c1, byte c2, byte c3, byte c4) {
		this.k1 = c1;
		this.k2 = c2;
		this.k3 = c3;
		this.k4 = c4;
		this.PS = c1+c2+c3+c4;
		this.SIZE = (long) ( fact(PS) / (fact(k1) * fact(k2) * fact(k3) * fact(k4)));
		this.sequences = new byte[(int)SIZE][PS];
		this.count = 0;
		this.arrays = new Array[(int)SIZE];
	}*/

	// Factorial de un entero x //
	
	public static int fact(int x) {
		int result = 1;
		
		for(int i = x; i > 0; i--)
			result *= i;
		
		return result;
	}
	
	public static void main(String[] args) {
		p[0] = (double)(-Math.PI/2);
		
    		// Resolución del plano [-pi/2, pi/2] fijada en 1800 'steps'
    
		for(int i = 1; i < p.length; i++) { 
			p[i] = p[i-1] + (double)(Math.PI/1800); 
		}
		
		byte[] K = { k1, k2, k3, k4 }, copyseq = Arrays.copyOf(seq, PS);
		int offset = 0, digit = 1;
		
		for(byte i : K) {
			for(int j = 0 + offset; j < i + offset; j++) {
				copyseq[j] = (byte) digit;
			}
			
			offset += i;
			digit++;
		}
		
		System.out.println(Arrays.toString(copyseq));
		seq = Arrays.copyOf(copyseq, PS);
		
    		// Secuencia con subarreglos de 1 antena //
    
		/*for(int i = 0; i < PS; i++) {
			seq[i] = 1;
		}*/
		
		sequences[count] = Arrays.copyOf(seq, PS);	// Primera secuencia en la lista
		count++;
		
		// Secuencias sin restricciones, ordenadas de forma ascendente //
    
    		//exhaustive_unconst(seq, 0);
		
   		// Secuencias con restricciones, ordenadas de manera lexicográfica //
		
		exhaustive_const(seq);
		
		for(int i = 0; i < count; i++) {
			System.out.println(Arrays.toString(sequences[i]));
		}
		
		System.out.println(count + "\n");
		System.out.printf("%20s%27s%17s%13s%15s%n", "sequence", "SLL", "beamwidth", "time", "%");
		
		long startTime = System.nanoTime();
		
		//int index = 0;
		//double min_sll = 0;
    
		for(int j = 0; j < SIZE; j++) {
			arrays[j] = calculate(sequences[j], j);
      
      			// Búsqueda exhaustiva de la secuencia que produce el menor SLL //
      
			/*if (arrays[j].get_sll() < min_sll) {
				index = j;
				min_sll = arrays[j].get_sll();
			}*/
				
        
      			// Límites de los valores que pueden tomar ambos objetivos f1 y f2. Secuencias en frente de Pareto //
      
			/*if((arrays[j].get_sll() < -13.9) && (arrays[j].get_beamwidth() < 0.28)) { 
				System.out.printf("%s\t%.6f\t%.6f\t%.6f\t%.6f\t%n", 
						(String)Arrays.toString(sequences[j]), 
						(float)arrays[j].get_sll(), (float)arrays[j].get_beamwidth(), 
						(float)arrays[j].get_time(), ((float)100*(j+1)/count));
			}*/
			
			addFront(arrays[j]);
		}
		
		/*int N = (k1 * 1) + (k2 * 2) + (k3 * 3) + (k4 * 4);
		
		System.out.printf("%s\t%.6f\t%.6f\t%d\n", Arrays.toString(arrays[index].get_seq()),
			arrays[index].get_sll(), arrays[index].get_beamwidth(), );*/
		
		int bound = front.size();
	
		for(int k = bound-1; k > -1 ; k--) {
			int tmp = dominance(front.get(k), front);
			if(tmp < k) {
				k = tmp;
			}
		}
		
		long endTime   = System.nanoTime();
		long totalTime = (endTime - startTime);
		
		System.out.printf("%n total time: %.6f%n sequences: %d%n average: %.6f%n", 
				(float)totalTime*0.000000001, count, ((float)totalTime*0.000000001)/count);
		
		for(int i = 0; i < front.size(); i++) {
			System.out.printf("%s\t%.6f\t%.6f\n", Arrays.toString(front.get(i).get_seq()),
					front.get(i).get_sll(), front.get(i).get_beamwidth());
		}
		
		//return front;
		
		//int N = (k1 * 1) + (k2 * 2) + (k3 * 3) + (k4 * 4);
		
    
    		// Método para guardar datos en archivo CSV //
    
		/*try {
			String SAMPLE_CSV_FILE = "/home/aceofspades_19/Desktop/paretos/pres/pareto" + 
					PS + "-" + theta + "_34.csv";
			BufferedWriter writer = Files.newBufferedWriter(Paths.get(SAMPLE_CSV_FILE));
			CSVPrinter csvPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT);
			
			for(int j = 0; j < front.size(); j++) {
				//csvPrinter.print(front.get(j).get_sll() + "\t" + front.get(j).get_beamwidth());
				
				csvPrinter.printRecord(front.get(j).get_sll(), front.get(j).get_beamwidth(), 
						Arrays.toString(front.get(j).get_seq()), 
						AntennaArrayUtils.antelem_sum(front.get(j).get_seq()));
						
				//csvPrinter.println();
			}
			
			csvPrinter.flush();
			csvPrinter.close();
		} catch (Exception IOException) {
			System.out.println("Something went wrong");
		}*/
	}
	
  
  	// Añadir soluciones al frente por dominancia de Pareto //
  
	public static void addFront(Array array) {
		if(front.isEmpty()) {
			front.add(array);
			
		} else {
			double sll = array.get_sll();
			double beamwidth = array.get_beamwidth();
			
			for(int i = 0; i < front.size(); i++) {
				if((sll < front.get(i).get_sll()) || (beamwidth < front.get(i).get_beamwidth())) {
					front.add(array);
					return;
				}
			}
		}
	}
	
	public static int dominance(Array array, ArrayList<Array> fr) {
		double sll = array.get_sll();
		double beamwidth = array.get_beamwidth();
			
		for(int i = 0; i < fr.size(); i++) {
			double f1 = fr.get(i).get_sll(), f2 = fr.get(i).get_beamwidth();
			
      			if(((sll < f1) && (beamwidth <= f2))) {
				fr.remove(i);
			}
		}
		
		return fr.size()-1;
	}
	
	public static void sortFront(ArrayList<Array> f, int a, int b) {
		int i = a, j = b;
		Array piv = f.get(a), aux;
		
		while(i < j) {
			while((f.get(i).get_sll() <= piv.get_sll()) && (i < j)) i++;
			while(f.get(j).get_sll() > piv.get_sll()) j--;
			
			if(i < j) {
				aux = f.get(i);
				f.add(i, f.get(j));
				f.add(j, aux);
			}
		}
		
		f.add(a, f.get(j));
		f.add(j, piv);
		
		if(a < j-1) sortFront(f, a, j-1);
		if(j+1 < b) sortFront(f, j+1, b);
	}
	
	public static Array calculate(byte[] seq, int j) { 
		double d = 0.5;
    
     		// Cada número entero en la secuencia representa un desfasador o subarreglo de j elementos de antena //
		
		long startTime = System.nanoTime();
		theta = 12;
		linear_array(seq, d, theta, p, j);		
		Array array;
		long endTime = System.nanoTime(), totalTime = (endTime - startTime);
		array = new Array(seq, sll, beamwidth, totalTime);
		
		return array;
	}
	
	public static void exhaustive_unconst(byte[] seq2, int piv) {
		for(byte j = 2; j < 5; j++) { // Subarreglo j en la secuencia
			if(piv < seq2.length-1) exhaustive_unconst(Arrays.copyOf(seq2, PS), piv+1);
			
			seq2[piv] = j;
			sequences[count] = Arrays.copyOf(seq2, PS);
			count++;
			
			if((j == 4) && (piv < seq2.length-1)) exhaustive_unconst(Arrays.copyOf(seq2, PS), piv+1);
		}
	}
	
	public static void exhaustive_const(byte[] seq) {
		// Encuentra el sufijo no-decreciente
    
		for(int k = 0; k < SIZE; k++) {
			int i = seq.length - 1;
      
			while (i > 0 && seq[i - 1] >= seq[i])
				i--;
			
			if (i <= 0)
				return;
				
      // Encuentra al pivote sucesor //
      
			int j = seq.length - 1;
      
			while (seq[j] <= seq[i - 1])
				j--;
        
			byte temp = seq[i - 1];
			seq[i - 1] = seq[j];
			seq[j] = temp;
				
      // Sufijo en reversa //
      
			j = seq.length - 1;
			while (i < j) {
				temp = seq[i];
				seq[i] = seq[j];
				seq[j] = temp;
				i++;
				j--;
			}
			
			sequences[count] = Arrays.copyOf(seq, PS);
			count++;
		}
	}
	
	/*public static byte[] subarrayConfig(byte[] seq) {
		  HashMap<Integer, Integer> repetitions = new HashMap<Integer, Integer>();
		  for (int i = 0; i < seq.length; ++i) {
		      int item = seq[i];
		      if (repetitions.containsKey(item))
		          repetitions.put(item, repetitions.get(item) + 1);
		      else
		          repetitions.put(item, 1);
		  }
		  StringBuilder sb = new StringBuilder();
		  int overAllCount = 0;
		  for (Map.Entry<Integer, Integer> e : repetitions.entrySet()) {
		      if (e.getValue() > 1) {
		          overAllCount += 1;
		          sb.append("\n");
		          sb.append(e.getKey());
		          sb.append(": ");
		          sb.append(e.getValue());
		          sb.append(" times");
		      }
		  }
		  if (overAllCount > 0) {
		      sb.insert(0, " repeated numbers:");
		      sb.insert(0, overAllCount);
		      sb.insert(0, "There are ");
		  }
		  System.out.print(sb.toString());
		
		return seq;
	}*/
	
	public static void linear_array(byte[] seq2, double d, int theta, double[] p, int k) {
		double[] afactor = new double[1801], afactor2 = new double[1801], anorm = new double[1801];
		byte N = AntennaArrayUtils.antelem_sum(seq2), phase_count = 1, subarray, count1 = 1;
		double[] phases = new double[N];
		Complex[] AF = new Complex[1801], PP = new Complex[N], PPtemp1 = new Complex[N], PPtemp2 = new Complex[1801];
		
		phases = AntennaArrayUtils.centers(seq2, d, N);
		
		double[] cos_taper = new double[N];
		double dtemp1, dtemp2, dtemp3, dtemp4;
		Complex ctemp1;
		
		for(int m = 0; m < N; m++) {
			// Ahusamiento de corriente con ventana de coseno alzado //
      
			dtemp1 = Math.cos((Math.PI/0.25)*((((phases[m]-1)/(phases[N-1]))/4) - ((1 - 0.25)/2)));
          
			dtemp2 = 0.5*(1 + Math.pow(dtemp1, 2));
			cos_taper[m] = Math.abs(dtemp2);
			dtemp3 = -2*Math.PI*d*(phases[m]-1)*Math.sin(theta * (Math.PI/180));
			PPtemp1[m] = new Complex(Math.cos(dtemp3), Math.sin(dtemp3));
			PP[m] = PPtemp1[m].multiply(cos_taper[m]);
			
			for(int h = 0; h < p.length; h++) {
				dtemp4 = 2*Math.PI*m*d*Math.sin(p[h]);
				PPtemp2[h] = new Complex(Math.cos(dtemp4), Math.sin(dtemp4));
        
				if (m == 0) {
					AF[h] = PPtemp2[h].multiply(PP[m]);
				} else {
					ctemp1 = AF[h];
					AF[h] = ctemp1.add(PPtemp2[h].multiply(PP[m]));
				}
			}
		}
		
		double max = 0;
		int max_index = 0;
		
		for(int i = 0; i < p.length; i++) {
			afactor[i] = AF[i].abs();
      
			if (afactor[i] > max && afactor[i] != Double.NaN) {
				max = afactor[i];
				max_index = i;
			}
		}

		for(int j = 0; j < p.length; j++) { 
			afactor2[j] = afactor[j] / max;
			anorm[j] = 20*Math.log10(afactor2[j]);
		}
    
    // 
		
		boolean flag1 = false, flag2 = false;
		
		int p1, p2, q1, q2;
		
		if(max_index == 0) max_index = 1;
		
		p1 = max_index;
		p2 = p1 - 1;
		
    
    		// Método para encontrar los ángulos en radianes de los primeros nulos aledaños al haz principal //
    
		while(afactor2[p1] > afactor2[p2]) {
			if (p2 <= 2) {
				p1 = 1800;
				p2 = p1 - 1;
				flag1 = true;
			} else {
				p1 = p2;
				p2 = p1 - 1;
			}
		}
		
		int tmp1 = p1;
		
		q1 = max_index;
		q2 = q1 + 1;
		
		if(max_index == 1800) max_index = 0;
			
		while(afactor2[q1] > afactor2[q2]) {
			if(q2 >= 1799) {
				q1 = 0;
				q2 = q1 + 1;
				flag2 = true;
			} else {
				q1 = q2;
				q2 = q1 + 1;
			}
		}
		
		int tmp2 = q1, 
			right_point, 
			left_point;
		
		if(flag1 || flag2) {
      			// El lóbulo principal se encuentra en su totalidad dentro del plano [-pi/2, pi/2] //
    
			right_point = tmp1;
			left_point = tmp2;
			
			Arrays.sort(anorm, 901, right_point);
			Arrays.sort(anorm, left_point, 900);
			
			// Cálculo de funciones objetivo f1 = SLL, f2 = FNBW //
      
			beamwidth = ((Math.abs(p[0]) - Math.abs(p[left_point])) + (p[1800] - p[right_point]));   
			sll = Math.max(anorm[right_point-1], anorm[899]);
      
		} else {
      			// El lóbulo principal excede las dimensiones del plano [-pi/2, pi/2] //
    
			right_point = tmp2;
			left_point = tmp1;
      
			Arrays.sort(anorm, right_point, 1800);
			Arrays.sort(anorm, 0, left_point);
			
			// Cálculo de funciones objetivo f1 = SLL, f2 = FNBW //
      
			beamwidth = Math.abs(p[right_point] - p[left_point]);
			sll = Math.max(anorm[1799], anorm[left_point-1]);
      
		}
	}
}
