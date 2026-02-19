import { LightningElement } from 'lwc';
export default class LeakExample extends LightningElement {
    connectedCallback() {
        const secret = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.FAKE.JWT.TOKEN"; // JWT token
        const pwd = "PlainTextP@ssw0rd"; // plaintext password
        console.log('Leaking secret:', secret, pwd);
    }
}
