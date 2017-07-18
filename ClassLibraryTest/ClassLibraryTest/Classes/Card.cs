using ClassLibraryTest.Interfaces;
using System;

namespace ClassLibraryTest.Classes

{
    public class Card : ICard
    {
        private int cardId;
        private int cardNumber;
        private int cardUser;
        private DateTime cardExpiryDate;

        public Card(int CardId, int CardNumber, int CardUser)
        {
            this.cardId = CardId;
            this.cardNumber = CardNumber;
            this.cardUser = CardUser;
            this.cardExpiryDate = DateTime.Now;
        }

        public int GetCardId()
        {
            return this.cardId;
        }

        public int GetCardNumber()
        {
            return this.cardNumber;
        }

        public int GetCardUser()
        {
            return this.cardUser;
        }

        public DateTime GetCardExpiryDate()
        {
            return this.cardExpiryDate;
        }
    }

}
