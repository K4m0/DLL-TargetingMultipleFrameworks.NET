using System;

namespace ClassLibraryTest.Interfaces
{
    public interface ICard
    {
        int GetCardId();
        int GetCardNumber();
        int GetCardUser();
        DateTime GetCardExpiryDate();
    }
}
