<?xml version="1.0" encoding="utf-8"?>
<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa quyển chứng từ" e="Delete Voucher Book"></title>
  <fields>
    <field name="ky" type="Decimal" maxLength="2" dataFormatString="#0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" maxLength="4" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="200">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [ky].Label, [ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEBf/fojOWV/LQYmBYdUUzbK32NJcAfXPPojCw26Aa+bTMGWErNVQnBG3lBJWaYQBTiIXeqSe0shMlFgix5FyXl4F/WvYAdOYmq+OXBGGUZw</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3EwXpy/VQkCyK7jzzTT8FHwORO/ewHIVuw0G6ub6+17g8rKPOGAY87k6QV0mqlVnYm7OOSLdkv//G9y0lsf5+nMccRUwQ8fQdXW/kuVcMN104bwYRYIKdwZmgbftAteYA0XrR/gMzlTDlgblpuNWPtptCK+tQaPWOrvxeZsPiCbSPIJg2eT+nkyb0UgfSHh6Gvtbn6UUYm1wPuYlOKwycbP2Q0r2olxmX9wdaUuCsCd</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBCTXXpTUy77nWtkI7DTqI9AQQvLMGCPQ+igIfI2Zl9e9z6xrmXicwuTbsK41LUnNeAwPBnCIdEbfEsg9uJClOaM</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESqaTy3ekxRSQAw0+ZhFUpFBPfx5nAvhtiiGWVJ7/XoH3PJHe2zlV4ZqBwtrUohLqi8nGF3uMYYQMKRM0X8/B7aGuhOMvQNm0iJ9Rg01GG+b4Hu/kdSihKXomSoq2h1r/gixb8HZgkuOsD3lq4rj6l5VuTXaXj9NeT5dlolbnnrU8cSTbRoJvJ+u5fssrCASkA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpz0b7IOs6YhwssPo/XlfkeXt3IC54th+SrgdPtIF9HwOuGt8gubpC3jlfbhm7qCjToGUaymWiQNqS0G2XZqy7SqYHlvsL/kIoeYfgbTRZLEasVFJUoriDF6J4B3gwZyCXzKhFao3qiD8B74oSzC/Ld069aLoxillim5rRtoZ3tqdBZXrkzYLXMjr0Wf1UEWfsfi4A9Oz9tMT+TeXgALHe5+jgwnbJv8AAeMZPxQqNjwxHt06s3sNqQwvDm1L25pwbFwGLTtGh6gfQifm/FpT9TuNcKPuOqvVRCPzTO9J6BWJjtvD9wLjaVPrxLjb2oydR0Vc3u19lbmENA8Xo/8ShjNZRLh7KSUYlzxEENH74gPUsKUmoB6Lk7OuKqRjMS5jL+fbB9gpIuf0SjIMfcsrwL5+g4KVZpcD3mzNHbgIdSZ/5/7xPtgJDZLqKhozLFtoTfbNm89g4v8WrJj/IyxH8YPai2kRzvRWdQ4QfjjGoKc1SVYdr648l1G8J8YFDrNk2wEmTLm5iHnzQveVsmK/sec+t6ITNGPoDtJEOqMzAefnYSRDfmSYV0c4+Eq3mn3tvAlO5QGJDiK8JAr45laji2mdFyip4CDg6T9nzACRonoo89pWvaT0RJFPVACjhEb4wGOcLwUUm5MfDGGwygokyW76OhEP4jpjrwGRNwBCOl5c3ld1stVTaOsX3Bw3BV4/bx18PmCanCcsyfwqxL+7koSlphYPo6/w5W7hlS8wYidiy+qvNQIwa9v7S5yUXpSHHKAHUyEf3pgyogQDOTShil4Sng6MQEU+hLRpVLL1GipyDtQzmz8D/Xo/9i4fG27+l6q72TtY7YuqPksMTA2bXLjYR+M4wS2Njm1h+br3x7KGr85fgHQ8tZSChQ5Yn/34whzKBo5z819WvQgIkBu4CSE</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherBookDelete">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUqXxR2dx6Dga/4AdDMl/72tCyWvtUHI9oB/MuUSIDCHUTxBM+jAvUZ4+zhpu+Ee/eEJAhpKgiwMCrY9i2N0WEqsq7PCAXVveyZZiR/0SH3peC0tcNG2BjBtUvqC4RMt3qh3jE1AuUeAoIduXY1UupLv74Czmc3wn8/EXUa7UVe</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>