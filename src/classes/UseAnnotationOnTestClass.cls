/**
 * Rule: UseAnnotationOnTestClass
 * Description: All Apex test classes must have the @IsTest annotation.
 * This rule scans Apex classes and throws violations for test classes
 * that are missing the required annotation.
 */
public with sharing class UseAnnotationOnTestClass {

    public class RuleViolation {
        public String className;
        public String message;
        public Integer lineNumber;

        public RuleViolation(String className, String message, Integer lineNumber) {
            this.className = className;
            this.message = message;
            this.lineNumber = lineNumber;
        }
    }

    // Entry point: Call this method with your org's Apex class definitions
    public static List<RuleViolation> execute(Map<String, String> apexClasses) {
        List<RuleViolation> violations = new List<RuleViolation>();

        for (String className : apexClasses.keySet()) {
            String source = apexClasses.get(className);
            if (isPotentialTestClass(source)) {
                if (!hasIsTestAnnotation(source)) {
                    violations.add(new RuleViolation(
                        className,
                        'Test class "' + className + '" must be annotated with @IsTest.',
                        findClassDeclarationLine(source)
                    ));
                }
            }
        }

        return violations;
    }

    // Identify if class name or methods suggest it's a test class
    private static Boolean isPotentialTestClass(String source) {
        // Basic check: class name contains 'Test' or source has testMethod
        return Pattern.compile('\\bclass\\s+\\w*Test\\b', Pattern.CASE_INSENSITIVE).matcher(source).find()
            || source.contains('testMethod')
            || source.contains('@IsTest');
    }

    // Check for the required annotation
    private static Boolean hasIsTestAnnotation(String source) {
        Pattern annotationPattern = Pattern.compile('@IsTest', Pattern.CASE_INSENSITIVE);
        Matcher matcher = annotationPattern.matcher(source);
        return matcher.find();
    }

    // Find where the class is declared (to report line number)
    private static Integer findClassDeclarationLine(String source) {
        List<String> lines = source.split('\n');
        for (Integer i = 0; i < lines.size(); i++) {
            if (lines[i].toLowerCase().contains('class ')) {
                return i + 1;
            }
        }
        return 0;
    }
}
