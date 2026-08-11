namespace RallyHelper.Pwa.Services;

/// <summary>
/// Faithful re-implementation of the arithmetic used by the original VB6
/// "Rally Helper" (by SpeedsterK), with the hour-overflow bug fixed.
/// </summary>
public static class RallyMath
{
    public const double MilesToKm = 1.6093;

    public record Hms(int Hours, int Minutes, int Seconds);

    public static Hms ToHms(double totalSeconds)
    {
        totalSeconds = Math.Max(0, Math.Round(totalSeconds));
        int h = (int)Math.Floor(totalSeconds / 3600);
        int m = (int)Math.Floor(totalSeconds / 60) % 60;
        int s = (int)Math.Round(totalSeconds - (h * 3600 + m * 60));

        if (s == 60)
        {
            s = 0;
            m++;
            if (m == 60)
            {
                m = 0;
                h++;
            }
        }

        return new Hms(h, m, s);
    }

    public static string FormatTime(double totalSeconds) => ToHms(totalSeconds) switch
    {
        var (h, m, s) => $"{h:00}:{m:00}:{s:00}"
    };

    public static bool TryParseTime(string h, string m, string s, out double totalSeconds)
    {
        totalSeconds = 0;
        if (!double.TryParse(h, out var hh) || !double.TryParse(m, out var mm) || !double.TryParse(s, out var ss))
            return false;

        totalSeconds = hh * 3600 + mm * 60 + ss;
        return totalSeconds >= 0;
    }

    public sealed record TableRow(int Index, double DistanceMiles, double TotalSeconds)
    {
        public string TimeText => FormatTime(TotalSeconds);
    }

    /// <summary>
    /// Builds the speed/time table for distances 0.1 .. 10.1 miles (i = 1..101).
    /// </summary>
    public static List<TableRow> BuildTable(double mph, double error)
    {
        var rows = new List<TableRow>(101);
        if (mph <= 0) return rows;

        for (int i = 1; i <= 101; i++)
        {
            double miles = i / 10.0;
            double totalSeconds = error * miles / mph * 3600.0;
            rows.Add(new TableRow(i, miles, totalSeconds));
        }

        return rows;
    }

    /// <summary>
    /// Seconds covered by a single 0.1 mile step at the given speed/error,
    /// used as the progress-bar span for the linked Timer2.
    /// </summary>
    public static double SegmentSeconds(double mph, double error) =>
        mph <= 0 ? 0 : Math.Abs(error * 0.1 / mph * 3600.0);
}