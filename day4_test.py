import unittest
from day4 import valid_room, decrypt

class TestEncryptionMethods(unittest.TestCase):

    def test_normal(self):
        room = "aaaaa-bbb-z-y-x-123"
        checksum = "abxyz"
        self.assertTrue(valid_room(room, checksum))

    def test_tied_letters(self):
        room = "a-b-c-d-e-f-g-h-987"
        checksum = "abcde"
        self.assertTrue(valid_room(room, checksum))

    def test_ironic(self):
        room = "not-a-real-room-404"
        checksum = "oarel"
        self.assertTrue(valid_room(room, checksum))

    def test_decoy(self):
        room = "totally-real-room-200"
        checksum = "decoy"
        self.assertFalse(valid_room(room, checksum))


    def test_decrypt(self):
        room = "qzmt-zixmtkozy-ivhz"
        sector_id = 343
        self.assertEqual(decrypt(room, sector_id), "very encrypted name")


if __name__ == '__main__':
    unittest.main()
