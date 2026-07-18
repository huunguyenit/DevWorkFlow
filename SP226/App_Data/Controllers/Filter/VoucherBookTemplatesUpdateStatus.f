<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật trạng thái quyển chứng từ" e="Update Voucher Book Status"></title>
  <fields>
    <field name="ky" type="Decimal" maxLength="2" dataFormatString="#0">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" maxLength="4" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="200">
      <item value="120, 40, 60, 330"/>
      <item value="11--: [ky].Label, [ky]"/>
      <item value="11--: [nam].Label, [nam]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEBf/fojOWV/LQYmBYdUUzYjuxFliN37xb6FYZg75FeS4Y8FUfP+6wy+InvA22sbFO04Pnh2nYy2EkUhlF5HobCyr2FbjlwpEulsIiQdE9Zp</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3EwXpy/VQkCyK7jzzTT8FHwORO/ewHIVuw0G6ub6+17g8rKPOGAY87k6QV0mqlVnYm7OOSLdkv//G9y0lsf5+nMccRUwQ8fQdXW/kuVcMN104bwYRYIKdwZmgbftAteYA0XrR/gMzlTDlgblpuNWPtptCK+tQaPWOrvxeZsPiCb4k4d9qc7QsXvu9Y37uEHt6gs+Nbsx63yaSH2axCJSs074vtuR0czxgufZqBJFUQv</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBB67XZjRZaoO5HBlgo2rUhNjwKpZOVQToGQgNamfxAWIxQu/CQnampE8LnyDafUF4FLoDaN/h4PbbSpBdkkxv03</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESqaTy3ekxRSQAw0+ZhFUpFBPfx5nAvhtiiGWVJ7/XoH3PJHe2zlV4ZqBwtrUohLqi8nGF3uMYYQMKRM0X8/B7aGuhOMvQNm0iJ9Rg01GG+bB5mBWIJvSRlI9Och9oyH7/KWOfbjCxWIJlW1ata8KnkTc3ytvJXUsDWjvvy4p9//8JFy8NHIiJRHx3jZlRuUlw==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpzbkbPxMC9pbruydLkUnp9MStFrkVK6dxpcFjp1UXS9YQ31W0Czbzon1KkZXcDp/gwX3N8A4g6G/qX4/DbG25RlcJhwc8X9/l5yVcbugW+KXFc0/dqGzZyP00tK6nHqwMZkU1SHYGMb//4HbmvSq6s++YRDBJuHlbrgVqf377sWSYppwGn1kXJNafTlS7acsO5W5K2+J62PgtRuqC45tJvQZic9U4OTYGZwGbaWDJqmqKfczj4vUbPmqYEGsOlSHgCYsojdPSCsRxH8UnO34RqWubFbBLTc/2tSXXRk4B2nGoP+uCMjPlSYCDBfL/o2P2Qp23ODR5puNWUMgnYJ+M05yJYICRKRDiPVIZX7Hx/HbP6994n5wHxGxhHG50B62EjXNbD1zr3tzrL2tdAihzbLC+n1Xh4MSYodiOkcn7NHnpOHgkInO/InyVw7Y87dZXbA7884AAofFdUnhemmNVMFXFj55A4tjuEnKfu4+lmyNjB4n78lJ27Lq8q9ri0uMysUkcY+JPcF/551RtatzElla9JTh4iVSH6niet+kJFbCxw8a3w5Q8KQVUXbhNyhkndsqvMFzsn3A3elo3TjVabATJNl1YKxG445E0bVkS0pa057HHm50OYi6oJueV6CokQl65evWdZl7xHTCVUF8t2aEJ3tB9XL1CkHuv8Tg+tH2P+fUgYCFlrPZkGVgei1KdYlCum9tDn5HKTOdNjuMHm25NGdd60upxo1mHE4UAtn0GhgHRxPTMFerhVUi1unf9/WQl5bk5RzbufoBp+jGa1r7NvNLHYtjt9shizHKfB7cw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherBookUpdateStatus">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUqXxR2dx6Dga/4AdDMl/72tCyWvtUHI9oB/MuUSIDCHUTxBM+jAvUZ4+zhpu+Ee/eEJAhpKgiwMCrY9i2N0WEqsq7PCAXVveyZZiR/0SH3RjHEL61iMOi19g9uccz6M6pEYL+iLcBuYgxkjwj9/0bJTjklvk9PkL0UO0yqrUL/lMV4l8JHZ22c1OMcoCVuIw==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>