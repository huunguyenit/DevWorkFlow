<?xml version="1.0" encoding="utf-8"?>
<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo quyển chứng từ" e="Voucher Book Generate"></title>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEBf/fojOWV/LQYmBYdUUzauicWQHpmMPK5hi2bgjC0huS4B3YZ2kUBCy0Wokj5DBYfdLFIomrjlEvV2//VuhttW2XwTYHD4CP8ZCQNEGu2v</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3EwXpy/VQkCyK7jzzTT8FHwORO/ewHIVuw0G6ub6+17g8rKPOGAY87k6QV0mqlVnYm7OOSLdkv//G9y0lsf5+nMccRUwQ8fQdXW/kuVcMN104bwYRYIKdwZmgbftAteYA0XrR/gMzlTDlgblpuNWPtptCK+tQaPWOrvxeZsPiCbh05NjFCVg9eb0gvteadQhHEZX96znXDx+Vn4Ppg3wx0wBZrx+TnvBv3TB2c8Ob7b</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSxUTjSdwpeFyDkTvWrtBDJrAouHNvCPVQzIrMbJ3Amd/xCVoPt9g8k+6I59/5T/5Vci+ugReb7qwftY0xe/uc9MlTctrF/bSFiZOD03jJS</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2ESqaTy3ekxRSQAw0+ZhFUpFBPfx5nAvhtiiGWVJ7/XoH3PJHe2zlV4ZqBwtrUohLqi8nGF3uMYYQMKRM0X8/B7aGuhOMvQNm0iJ9Rg01GG+b1MtGatbpHiEvFCzG3T7xiVdFINmzKBtpvgnNM+Rtc/oQPCAhGQqXfCCy8Vl37eaJhTDWh50IY8hvL/lO5VmXJQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpyTLWvTDi5yJv7troLYsB6Z2vlZF8do6Rvg//ikiOefW5uqQwHhnE/1ZVJVOql+6BsKlGjRXPTDbfajw8SPgX1AJYHYA5Tnnx75PYtRLQ2rmJWfwbJDsU4nNLIE2+b0/uChSjdcv5O8/btfVd26A4gOU5dXg+dHg/dgwr4TwBImW5H4jBJQYrBhdjKdO0GAezWkf8rpO/cdr2Vp/EJ5uu5mbkHj6lS2xbX5J5S2AEAgDa7qQ2XtQYeVbbfA8T4rwsQMJPmbpGeVji/qBDzguEPCYfC8aUF/DNRqaZxHXENyBaME/ZXM51LhiuLAHoI6U9rWGJ6sTQPOUIyjFJExVf9DpRWSP84kyYJw2CkWIP5dEUMmQx/c6H1JZKMASG4GSJyKW36viuPRSuqLGybwCtNx9ul3UP+l2Nra4NLQgV500ekn04xjgme/k9yZ7bhSsE+kVf0ztQN1eom7nkMFTzHSdCyQ1phCBZGxhr9kXL/39iODIkjull8WKC8oL7G+OtXq24QKED+fO7DyZQ26kpy0VtPnYfjCuY3nhkh4B5EtDtLU7I6AEAO4ERCqlli+sH+wlAjDmwLD+StT9vUg0jfQ1KSCcxKwZxnEh3RmyjiBGvLjlDbO1e+eOETJ9iere+QjCExP7Wg6J/31pbQrUNzrl8mTAurgDkdJ/X3KOO4eAp2ej69ijebnPI3yZf9cgxfzgiQ27kQlBXHh+/Al93a3PC4Pcd/vRJwsxpIs7VLlOjXiB+/EyjeMwmyH4Od1FrZPWc8VAkfzA20EqN8b7NUO</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="VoucherBookCreate">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUqXxR2dx6Dga/4AdDMl/72tCyWvtUHI9oB/MuUSIDCHUTxBM+jAvUZ4+zhpu+Ee/eEJAhpKgiwMCrY9i2N0WEqsq7PCAXVveyZZiR/0SH3lqW52doy8VJttJaQrb7B/+hywMc/THjRK/vuyMJjNf4pYrK8P08GW+IlbRupXA7X</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>