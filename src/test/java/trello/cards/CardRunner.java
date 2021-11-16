package trello.cards;

import com.intuit.karate.junit5.Karate;

public class CardRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
