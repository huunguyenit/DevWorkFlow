<?xml version="1.0" encoding="utf-8"?>

<dir table="options" code="name" order="name" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Cập nhật tên yêu cầu sản xuất ngầm định" e="Update Work Order Name with Default Value"></title>
  <fields>
    <field name="val1" maxLength="100">
      <header v="Tên yêu cầu sản xuất" e="Work Order Name"></header>
    </field>
    <field name="val2" maxLength="100">
      <header v="Tên khác" e="Other Name"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 200, 130, 0"/>
      <item value="1100: [val1].Label, [val1]"/>
      <item value="1100: [val2].Label, [val2]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcA2mKQxWB4EeqXEJfj7JkxF2FdTvsjRNVntbl+nd7GmpBOroLX/2/mSlGt0DgJ23HIetsEdYJY9oX/IF2TD8syBcHi1vnvHKCCa0b+H9vo1AZVM98FVsUWC+VQTFOQKistmsp4V4nIOKh3Ffk322g5dB8KgWzMTOjnyGQJ5bM91U</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5zCNz0a0Q/5DXMbLSwlsrkUNAaCMwt8+rYobqVVxLdJevxqT5uI7laj1Hn1WwUnSgVRXkQTCOHIpP4cPeYNmQ7Nqamu7Y8rJXapK2kP0r2KIXN1ofgKnCPpiUTrhf0IRtKHcswYlb9YHZYDE6UNh0ak</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aJY37GzVteQ+J3KJhn9LMA=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&HcddcFhSZ/AMuD4kh40f9kJq18Rh1IRSoAY6VfVKCEHtqK+PXQ6yQGYew7LYbX7+4HIZjLNW9jpaKBe8NNndILc+IzmiE32kM0qua1liuAqCRAVYe8Eqy0JsljBzKeED</Encrypted>]]>
      </text>
    </command>
  </commands>
</dir>