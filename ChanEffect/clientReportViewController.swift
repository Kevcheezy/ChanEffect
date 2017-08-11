import UIKit
import Charts

class ChartsViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Do any additional setup after loading the view.
        let ys1 = Array(1..<10).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) }
        let ys2 = Array(1..<10).map { x in return cos(Double(x) / 2.0 / 3.141) }
        
        let yse1 = ys1.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        let yse2 = ys2.enumerated().map { x, y in return ChartDataEntry(x: Double(x), y: y) }
        
        let data = LineChartData()
        let ds1 = LineChartDataSet(values: yse1, label: "Hello")
        ds1.colors = [NSUIColor.red]
        data.addDataSet(ds1)
        
        let ds2 = LineChartDataSet(values: yse2, label: "World")
        ds2.colors = [NSUIColor.blue]
        data.addDataSet(ds2)
        self.lineChartView.data = data
        
        self.lineChartView.gridBackgroundColor = NSUIColor.white
        
        self.lineChartView.chartDescription?.text = "Linechart Demo"
        /*
        // Do any additional setup after loading the view.
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let bmi = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
        setChart(dataPoints:months, values: bmi)
 */
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.lineChartView.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    /*
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries = [ChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(values[i]))
            dataEntries.append(dataEntry)
        }
        
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "BMI Value")
        
        //let lineChartData = LineChartData(dataSet: lineChartDataSet)
        let lineChartData = LineChartData()
        
        lineChartData.addDataSet(lineChartDataSet)
        
        lineChartView.chartDescription?.text = "BMI Progress"
        lineChartView.data = lineChartData
        
    }
    */
}
