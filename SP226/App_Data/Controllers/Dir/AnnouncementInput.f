<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY MaxLength "512">

  <!ENTITY % NotifyPush SYSTEM "..\Include\NotifyPush.ent">
  %NotifyPush;
]>

<dir table="cntb" code="ma_tb" order="datetime0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông báo" e="Notification"></title>
  <fields>
    <field name="ma_tb" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="user_name" external="true" defaultValue="''" allowNulls="false">
      <header v="Người nhận" e="Recipient"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment%l" key="" check="" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99MpcZRaaFKU7kZBL0mUQ77WCASHRVK1mFcupNQjgJfQO9ScoAeaTHfq8xfqwoBqK6A==</Encrypted>]]></clientScript>
    </field>
    <field name="comment%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="user_id" type="Decimal" disabled="true" hidden="true" readOnly="true" clientDefault="0" inactivate="true">
      <items style="Numeric"></items>
    </field>

    <field name="tieu_de" allowNulls="false">
      <header v="Tiêu đề" e="Title"></header>
    </field>
    <field name="noi_dung" rows="3">
      <header v="Nội dung" e="Content"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 100, 130, 0"/>
      <item value="111001: [user_name].Label, [user_name], [comment%l], [user_id]"/>
      <item value="110001: [tieu_de].Label, [tieu_de], [ma_tb]"/>
      <item value="11000: [noi_dung].Label, [noi_dung]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcK+B4bykINjJkaJTybwM76WHJ0QTmSNPBCXOoy2HDG88Eo1PbG2snDUlsN/xy7hwV3zKwwuhqMfyixdYNSgRwYCmWg5UormYdgl8k9R8URSS</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIQUusWmka7CpqPVsOgcNcN8T/B4Mbm6xPZkA+klpCpsQ0ysX+54h1eZq4j+m7SgVtl1YZ/xNMTXaPx/fAoyvkU=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEj7ZYwJaqtWE8gGzNwLdQnuoaT7ZgF3w/QWnVOfAL8Ce9UYH0VpHLGWkh+thiqj/vvZ77HvBuW/mX3RgH8rKr4P1CYNjaFXVudNgb38etS1QtvXnHWoSPkWurSvb6z7fftXmNqKtCM1i/mFAiW7amGALcTzW4Bodbz7Sn0gadkjXYcxuORKA4+LlKw2ZboJjNIfZv7DVGd5M0i5H/k+kK8fkSSvhMgwK4VvDrQA8Ebxm8wLRpbx77Akgho73Q/K/ZptZgtSSzADgxWN7Fheq+0vXTE7lzmKMr5VFfDpjeTq</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw436wCdcatnCMkqoJWOhXykGwe9TcAaJvRMzoH0e7bmokK9avS0Jj8RJDOWTYSU1Y11U8cG8g3d4sZkdt+FcNCKhDn44uAtWFQB/h1E/4E2EtCVREf7TC4jncdeCGMRWTBXXMHpasygL26qiSURkhVP55KiqKKiWqnomNErfP9RpYIWiDftU7lTRUiosAe9pisZrYPyfWfUsX3b1rn10XuFiam41xHfhYN1JXpGvlu05fTdc71b0Qa0zm8TKr1qpZo8FvyjOLesRH6SyH86ixM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx77GQblyTNxLR+6yFDOSQhePM8wiPBvTH01v/2ZZuc8Cu3skoKojhPeyLB7dlWj5m9GOOgLf9iHO+h/gic9E2LC0Ja/fBHgWNiSmuChO772EHVEbUKjAdINQd3IN9FzstK0QVgXqIc/QX5N9/OMUdnVfF5LzeGdTlRFinz/DCUjWjPGK5HqYaDSAI8dulVYGAkw3qVipl+5cAiM3x2KzYVRA6vt8k3B0RcSvtNur20JSPnpMNxu9YpRtxo+clykVfERE7ONqJx7AUYhd5cXYpM5ekqR0rJIMb+fu0gOEyP59C/+/fMMhzUTsbsu0cMM0kk=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &NotifyPushDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0g+4yHQGQCDtKrNFEFV3J5VS/tmuIYYm0oG7XXi111SRGa1udzhrbKcM5pDcnSNzEfzxVo9Lru+SFE8OfQ8vrshvnuS5csKys9crqD/3HfFsQod2r71hlMkdv4OYY6TIoR7jwnsmnxusMebKx2D1205lSmPJ1mgqCOPeWRJFpeXT4eRvghA6FqtTEqYhBK4+RWyhnqYzBWTFUzEtfk8XPptDIlRQn5gvK2fVRgOzCVNA7L+ko77qJcPlOIm07QKWFInfKADgDxW4cKQIANLL1RR1qjPiRW8PeNx84Z8iErZR66jsjyM0fMepofrAKUquK/P+XTxcc2k6Owcdy3hbM3D1dCJBloAuYgz8a5kGFFrEZMcwJm+gP4zEhbJ5juH9Ty29g5EjzfNZC3bxFSDyx3Uzd8JEoyy8qa8JpfgA5Q+kwlNWVEbdE2qnzFK6HCzU2s=</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&GbrW0DdRonWwdxr4MN7lz9jFlxscgIq3OOmZHjOugfgvyb/lkaoKzhmEo+USr1JjfiQm0KnYbbqkfFdvNHwX3w==</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&yUC4yM6BajJ5rCxKWI2HjNmW5YbWMveOIkJ8Hf0eJhjgbtoXBXocL6H2zNFEY/Saae3j9onrbnwfA+Se6mPNB85N57hWApV6j2J4QMkYcACgszvzeIdjDpZk2A//LMzX</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&GbrW0DdRonWwdxr4MN7lz9jFlxscgIq3OOmZHjOugfgvyb/lkaoKzhmEo+USr1JjfiQm0KnYbbqkfFdvNHwX3w==</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&yUC4yM6BajJ5rCxKWI2HjNmW5YbWMveOIkJ8Hf0eJhijorp/HmG29oAIE04JnHpn5y+M8zN3N+wiL76sBPKmFPaNGgQiTTSGFxBxFbhdJU8ZCBqnR40dcGSDoUT4/5Xz</Encrypted>]]>&NotifyPushSetInvoke;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dhEkVV+eqlaQ7n19hC1OfHqQmONcXqkvSenHdQy0oI0xly6Yb744KYZPk6Q8MRbYUw8EBYmTuFtwNXdstjgAy2VyJqUzrQ5JUM3IK56wD9ggDAhmsOI9ZEW2eMxELXCDw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx77GQblyTNxLR+6yFDOSQhePM8wiPBvTH01v/2ZZuc8Cu3skoKojhPeyLB7dlWj5m9GOOgLf9iHO+h/gic9E2LC0Ja/fBHgWNiSmuChO772EHVEbUKjAdINQd3IN9FzstK0QVgXqIc/QX5N9/OMUdnVZmrKv4tRlFtdJ1QYG000LYXBXVMHt6iSEylZOvuJytU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        &NotifyPushDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0g+4yHQGQCDtKrNFEFV3J5VS/tmuIYYm0oG7XXi111SRGa1udzhrbKcM5pDcnSNzEfzxVo9Lru+SFE8OfQ8vrshvnuS5csKys9crqD/3HfFsQod2r71hlMkdv4OYY6TIoR7jwnsmnxusMebKx2D1205lSmPJ1mgqCOPeWRJFpeXT4eRvghA6FqtTEqYhBK4+RWyhnqYzBWTFUzEtfk8XPptDIlRQn5gvK2fVRgOzCVNA7L+ko77qJcPlOIm07QKWFInfKADgDxW4cKQIANLL1RR1qjPiRW8PeNx84Z8iErZR66jsjyM0fMepofrAKUquK/P+XTxcc2k6Owcdy3hbM3D1dCJBloAuYgz8a5kGFFrEZMcwJm+gP4zEhbJ5juH9Ty29g5EjzfNZC3bxFSDyx3Uzd8JEoyy8qa8JpfgA5Q+kwlNWVEbdE2qnzFK6HCzU2s=</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&GbrW0DdRonWwdxr4MN7lz9jFlxscgIq3OOmZHjOugfgvyb/lkaoKzhmEo+USr1JjfiQm0KnYbbqkfFdvNHwX3w==</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&yUC4yM6BajJ5rCxKWI2HjNmW5YbWMveOIkJ8Hf0eJhjgbtoXBXocL6H2zNFEY/Saae3j9onrbnwfA+Se6mPNB85N57hWApV6j2J4QMkYcACgszvzeIdjDpZk2A//LMzX</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&GbrW0DdRonWwdxr4MN7lz9jFlxscgIq3OOmZHjOugfgvyb/lkaoKzhmEo+USr1JjfiQm0KnYbbqkfFdvNHwX3w==</Encrypted>]]>&MaxLength;<![CDATA[<Encrypted>&yUC4yM6BajJ5rCxKWI2HjNmW5YbWMveOIkJ8Hf0eJhijorp/HmG29oAIE04JnHpn5y+M8zN3N+wiL76sBPKmFPaNGgQiTTSGFxBxFbhdJU8ZCBqnR40dcGSDoUT4/5Xz</Encrypted>]]>&NotifyPushSetInvoke;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Qbx2d2doczcla281zBkrH9qB4CL/9fNwYlsjxs0Po3mU3y/B6iMl9lWd+ddOoMyIIMwO360SS2x6pPQU25omn+aUd6juvmsUrYivnir95Qudrz9K+E9b1hNDl6OV+U62lzhM/RBBwTDmkerHa8efYWysoOZMnBN2gQJ37D9A1cm8UddwQZs6w7SjmUIMLTJJQ==</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcsNyTGF8pw8AgFNy9DQzrJGAQNeNxyjDcEE5QCdtCn4KmPVtr6ivd6Frsein7jqcn6Gnt+p7PROEDeevu8UW22BaxI8UYT+Rr+ddt3pqJKku+xxD1lrUlj4WQcI9p9/bP61zaTPI+zvLQoSirv66EOm/8lcqR0J+PIcY/opHSN8Ap6uzgIknRwxXkI9Eure4P2Hc27VJNvfdL3ZoTYap7iAE4tqjLO7Ditl3a9/7Y0d3fiq0BQq7sGrWyZiqvnILMNKxw+RdIWMMPQWHIe/mjpk6iqCv8o7gxB2LtKk2O3k6SkTYN+HQpcp3pju7jGxZyBxXdW0ZVbmgSCryd5YEhk=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4axea3rs9GcwsMhUWTvo9nfXnlW5hQgEeyZG9SNz6jyLP3gRC08BGK+Bh+ezdpbxdqiLZpEDr8NYglsAiwpzwP7zD6uCQCecOGzrahieSwVK7h5V46dPzUYRITZ3cNl9M=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>