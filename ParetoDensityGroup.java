package org.moeaframework.problem.AntennaArray;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.moeaframework.problem.AntennaArray.ExhaustiveMultiObjective;
import org.moeaframework.problem.AntennaArray.ExhaustiveMultiObjective.Array;

public final class ParetoDensityGroup {
	
	public static int PS = 6;
	public static int theta = 0;
	public static String PARETO1= "/home/aceofspades_19/Desktop/paretos/pareto" + 
			PS + "/mod/" + "pareto" + PS + "-" + theta + "mod.csv";
	public static ArrayList<byte[]> PARETO1BYTE;
	public static ArrayList<byte[]> CONSTRAINTS; 
	
	public static ArrayList<Array> PARETO_CONS = new ArrayList<Array>();
	
	public static void main(String[] args) throws IOException {
		int v = Math.round(PS/3);
		
		/*PARETO1BYTE = string2byte(PARETO1);
		CONSTRAINTS = abyte2cons(PARETO1BYTE);
		
		for(byte[] seq : CONSTRAINTS) {
			System.out.println(Arrays.toString(seq));
		}*/
		
		restrictions(20, 24);
		
		int bound = PARETO_CONS.size();
		for(int k = bound-1; k > -1 ; k--) {
			int tmp = ExhaustiveMultiObjective.dominance(PARETO_CONS.get(k), PARETO_CONS);
			if(tmp < k) {
				k = tmp;
			}
		}
		
		for(Array front : PARETO_CONS) {
			System.out.printf("%s\t%.6f\t%.6f\n", Arrays.toString(front.get_seq()),
					front.get_sll(), front.get_beamwidth());
		}
		
	}
	
	public static ArrayList<byte[]> restrictions(int a, int b){
		for(int n = a; n < b+1; n++) {
			partition(n);
		}
		
		return null;
	}
	
	public static void partition(int n) {
		partition(n, 4, "");
	}
	
	public static void partition(int n, int max, String prefix) {
		if(n == 0) {
			ArrayList<byte[]> seqs = new ArrayList<byte[]>(1);
			String stringrec = prefix;
			byte[] seq = new byte[stringrec.length()];
			
			for(int i = 0; i < stringrec.length(); i++) {
				char digit = stringrec.charAt(i);
				byte d = (byte) Character.getNumericValue(digit);
				seq[i] = d;
			}
			
			seqs.add(seq);
			CONSTRAINTS = abyte2cons(seqs);
			
			for(byte[] con : CONSTRAINTS) {
				if(((con[0] + con[1] + con[2] + con[3]) == PS)) {
					System.out.println(Arrays.toString(con));
					
					ExhaustiveMultiObjective problem = new ExhaustiveMultiObjective(con[0], 
							con[1], con[2], con[3]);
					
					PARETO_CONS.addAll(0, problem.main());
				}
			}
			
			return;
		}
		
		for(int i = Math.min(max, n); i >= 1; i--) {
			partition(n-i, i, prefix + "" + i);
		}
	}
	
	public static ArrayList<byte[]> abyte2cons(ArrayList<byte[]> pareto_array) {
		ArrayList<byte[]> CONS = new ArrayList<byte[]>(pareto_array.size());
		
		for(byte[] seq : pareto_array) {
			byte dig1 = 0, 
				 dig2 = 0, 
				 dig3 = 0, 
				 dig4 = 0;
			
			byte[] cons = new byte[4];
			
			for(int i = 0; i < seq.length; i++) {
				switch(seq[i]) {
					case 1:
						dig1++;
						break;
						
					case 2:
						dig2++;
						break;
						
					case 3:
						dig3++;
						break;
						
					case 4:
						dig4++;
						break;
				}
			}
			
			cons[0] = dig1;
			cons[1] = dig2;
			cons[2] = dig3;
			cons[3] = dig4;
			
			CONS.add(cons);
			
		}
		
		return CONS;
	}

	public static ArrayList<byte[]> string2byte(String path) throws IOException {
		ArrayList<byte[]> records = new ArrayList<>();
		Reader reader = Files.newBufferedReader(Paths.get(path));
		
		try(CSVParser parser = CSVParser.parse(reader, CSVFormat.EXCEL)) {
			for(CSVRecord csvRecord : parser) {
				String stringrec = csvRecord.get(2).replaceAll("[^0-9]", "");				
				byte[] seq = new byte[PS];
				
				for(int i = 0; i < stringrec.length(); i++) {
					char digit = stringrec.charAt(i);
					byte d = (byte) Character.getNumericValue(digit);
					seq[i] = d;
				}
				
				records.add(seq);
				
			}
			  
		} catch (Exception IOException) {
			System.out.println("Something went wrong");
		}
		
		return records;
	}
	
	/*public static byte density2elements(double[] dseq, int v) {
		int[] elem = new int[dseq.length];
		
		int a = 4*v,
			b = v,
			diff = a-b+1;
		
		double[] dtable = new double[diff];
		
		for(int i = 0; i < diff; i++) {
			dtable[i] = (double) (i+v)/a;
		}
	
		int index;
		double upper, lower;
		
		for(int j = 0; j < dseq.length; j++) {
			index = Math.abs(Arrays.binarySearch(dtable, dseq[j]) + 1)-1;			
			elem[j] = index+v;
		}
		
		
		return 0;
	}*/
}
