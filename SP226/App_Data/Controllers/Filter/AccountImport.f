<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "AccountImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">
]>

<dir table="dmtk" code="tk" order="tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="xoa_yn" type="Boolean">
      <header v="" e=""></header>
      <footer v="Xác nhận xóa danh mục tài khoản hiện tại" e="Confirm delete"></footer>
      <items style="CheckBox"/>
    </field>
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 25, 75, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
      <item value="-110000: [xoa_yn], [xoa_yn].Description"/>
    </view>
  </views>

  <commands>
    &UploadCommand;

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n6B9qb9EXsh+IKi8uYanRXhzxkt+nwaAIIOO54f6eIeRtYC1gJtTX1OQVkh00meUCo6dzmk/bRPBEg8mKhSlSZg/8sBGopZqpckmIOeyiD8sg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pzmE5chSLTUsRU/oQi8qvIvTBRzoIephrRkZtXbFyoIR/s/U0iVjvN+1YTMIslWrdpnZlXU8liwOGOGmueTwYSF9VPkQS1ljpZoNk57YdHhgJ84Hokgk+tqDrLiTqSXXknoapSYNjLaAJAVZ5mLYze1MBMdUEWTHQswr7KHdkqv5X91LlyswktbfeNVwzkhNF1ksrq8K6BcLpBDj7taoxsTAqVOn51nbwX1HafYMS9ClYa7DqAKrQD3SehaViMaYhAshd7pnP9gncxWxTGgivPmGV3Av+bg/9UyR4T6HGTLRG4iMzitsrmp37y+LsX4tCRZKA7OVXURuJBsGWYr1SpIT4fKmkTgnOaRX05mv9Lh2EKM6SDgXsdMkByoQrG9s4l0SEIqPhl0UCZtllIbi+GO5b3niMA83F1majXJdCaLojjifHB6YutxCZrNTyoeuSuOdM8XEji4/fteuShkPRK+PZ2eQ8/xL/Ah4EVZ1c52eG3w92ykshNloNayGBElyD+pX7Bc+acN7v2G0L4bdN8=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&C2oX7For6o4fC973pcIHekWrmeUExlya6Z/B5EniQdASbXcYYrDlgdXzEqia3fpsdsZpZMI/uladqLAmeJVYero6nmf9QroXRvlDAIrKFWnl1ljW+Iz5ugXuWY0nRXN7HSM/6ZnGw3BCx6BqOI5iYLFL45PcE+yTQdzO202yFL0mjF0V7hYh+Gxb6SGaQ+lHWn+jzwXdpwsQquH0A5pbrElEDTy7MBFIi0twzGZKHm9rXm6lbs8CgCg5RmdbV0Sgoo3W/kQmnPM9AvX/BgeUM9MxLeUEA/VOfJV6JaB+e/J/IJNJXZIeiOJFVUzIC9GNxdmnPJnmZTNYK6blqcnKQ8PSWnMjKTNZj+G1lwu5xJUhIC+1K++T9yZJNzavUHbfJmOS+LltCC5WiaCxhwtse0016mvhRXBUPRMTtNRduhRm1kLZ63MEC662Cu4gOwi6IbWZm6M28rmgF+bzEg4/T9Im6g+MV0WOmEQIvMj/aEtbLtLG70KECVm7Ag2+zRHOETNCS7p4ekwDDCxYXuwvvZR1uPs4W8yNVuGdkJuvgjs=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rio0AigvPLuXO/MHeQX85sySrdbs7aYaq32DVM6ulJTbusevIKgB7hqcKSdXyPaB+Vk2S6qo08z6ynPvziNxXd0t8uJnMX9iQ1cziAIQOz65ARaqWke4PZDj06jpKxG+d9eSRSHG99W+n24oyXr/2b9HOtvi9KglzUQaHLhNUxNDYnWfR1p08bohrKu8g3UyabFCvI//2+F6Za55hfU6sLELcWLM4cKCBOvKmBNuwC0Xg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvH2B9AbC3gGjvZsyouqrw2ACDEcSNQsHTy4BP1s/hpvIFHhqfusSMfE+MfcooOE7QTf7hIR7/gKcqG5DNsKHOy0uL2LNGfZ0GUN0CnNxvxC857UjeLRsb7mOZ79eLrxJz</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>