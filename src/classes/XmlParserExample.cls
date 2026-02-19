public class XmlParserExample {
    public void parseXml(String xml) {
        Dom.Document doc = new Dom.Document();
        doc.load(xml); // 🚨 Improper XML parsing can be risky if not validated

        Dom.XmlNode root = doc.getRootElement();
        String nodeValue = root.getChildElement('UserInput', null).getText(); // 🚨 Potential issue
    }
}
